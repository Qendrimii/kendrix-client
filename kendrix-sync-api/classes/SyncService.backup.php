<?php
/**
 * Sync Service for data processing
 */

class SyncService
{
    private $applyOrder = [
        'Subjektet', 'TVSH', 'Kategoria', 'ArtikulliBaze', 'Shfrytezuesi',
        'FaturaKategoria', 'MenyraPageses', 'Pagesat', 'Fatura', 'Porosia',
        'BlerjeKategoria', 'Blerjet', 'PorositeEBlerjes', 'Stoku', 'Normativa', 'ZRaportet'
    ];

    public function apply($tenantId, $table, $fromVersion, $toVersion, $rows)
    {
        $startTime = microtime(true);
        
        // Validate table is in allowed list
        if (!in_array($table, $this->applyOrder)) {
            throw new InvalidArgumentException("Table {$table} is not allowed for sync");
        }

        // Check if this is out of order
        try {
            $currentVersion = $this->getCurrentVersion($tenantId, $table);
            if ($fromVersion < $currentVersion) {
                error_log("Out of order sync detected: tenant_id={$tenantId}, table={$table}, from_version={$fromVersion}, current_version={$currentVersion}");
            }
        } catch (Exception $e) {
            error_log("Failed to get current version: " . $e->getMessage());
            // Continue with processing, assume version 0
            $currentVersion = 0;
        }

        $counts = [
            'accepted' => 0,
            'skipped' => 0,
            'errors' => 0
        ];

        if (empty($rows)) {
            return $counts;
        }

        $db = Database::getInstance();
        
        try {
            error_log("Starting transaction processing");
            
            // Check if we're already in a transaction
            if ($db->inTransaction()) {
                error_log("Already in transaction, skipping beginTransaction");
            } else {
                error_log("Starting new transaction");
                $result = $db->beginTransaction();
                if (!$result) {
                    throw new Exception("Failed to start transaction");
                }
                error_log("Transaction started successfully");
            }

            // Process deletes first
            $deleteIds = array_column(array_filter($rows, function($r) { return $r['op'] === 'delete'; }), 'Id');
            error_log("Delete IDs: " . json_encode($deleteIds));
            if (!empty($deleteIds)) {
                error_log("Processing deletes");
                $deleted = $this->processDeletes($tenantId, $table, $deleteIds);
                error_log("Deleted count: " . $deleted);
                $counts['accepted'] += $deleted;
            }

            // Process upserts
            $upsertRows = array_filter($rows, function($r) { return $r['op'] === 'upsert'; });
            error_log("Upsert rows count: " . count($upsertRows));
            if (!empty($upsertRows)) {
                error_log("Processing upserts");
                $upserted = $this->processUpserts($tenantId, $table, $upsertRows);
                error_log("Upserted count: " . $upserted);
                $counts['accepted'] += $upserted;
            }

            // Update watermark before committing
            $this->updateWatermark($tenantId, $table, $toVersion);

            $db->commit();

        } catch (Exception $e) {
            // Only rollback if we're still in a transaction
            if ($db->inTransaction()) {
                $db->rollback();
                error_log("Transaction rolled back due to error");
            } else {
                error_log("No active transaction to rollback");
            }
            
            error_log("Sync transaction failed: tenant_id={$tenantId}, table={$table}, error=" . $e->getMessage());
            error_log("Stack trace: " . $e->getTraceAsString());
            
            $counts['errors'] = count($rows);
            $counts['accepted'] = 0;
            $counts['error_details'] = $e->getMessage();
        }

        $duration = (microtime(true) - $startTime) * 1000;
        error_log("Sync batch processed: tenant_id={$tenantId}, table={$table}, duration_ms=" . round($duration, 2) . ", counts=" . json_encode($counts));

        return $counts;
    }

    private function processDeletes($tenantId, $table, $ids)
    {
        if (empty($ids)) {
            return 0;
        }

        $placeholders = str_repeat('?,', count($ids) - 1) . '?';
        $params = array_merge([$tenantId], $ids);
        
        $db = Database::getInstance();
        $stmt = $db->query("DELETE FROM `{$table}` WHERE tenant_id = ? AND Id IN ({$placeholders})", $params);
        
        return $stmt->rowCount();
    }

    private function processUpserts($tenantId, $table, $rows)
    {
        if (empty($rows)) {
            return 0;
        }

        $upserted = 0;
        
        // Process in chunks to avoid memory issues
        $chunks = array_chunk($rows, 100);
        foreach ($chunks as $chunk) {
            $upserted += $this->processUpsertChunk($tenantId, $table, $chunk);
        }

        return $upserted;
    }

    private function processUpsertChunk($tenantId, $table, $rows)
    {
        if (empty($rows)) {
            return 0;
        }

        try {
            $firstRow = $rows[0];
            $columns = array_keys($firstRow);
            
            // Remove 'op' column if present
            $columns = array_filter($columns, function($col) { return $col !== 'op'; });
            
            // Ensure tenant_id is first
            if (!in_array('tenant_id', $columns)) {
                array_unshift($columns, 'tenant_id');
            }

            $placeholders = '(' . str_repeat('?,', count($columns) - 1) . '?)';
            $allPlaceholders = str_repeat($placeholders . ',', count($rows) - 1) . $placeholders;

            $values = [];
            foreach ($rows as $row) {
                $rowValues = [];
                foreach ($columns as $column) {
                    if ($column === 'tenant_id') {
                        $rowValues[] = $tenantId;
                    } else {
                        $rowValues[] = $row[$column] ?? null;
                    }
                }
                $values = array_merge($values, $rowValues);
            }

            // Build ON DUPLICATE KEY UPDATE clause
            $updateClause = [];
            foreach ($columns as $column) {
                if ($column !== 'tenant_id' && $column !== 'Id') {
                    $updateClause[] = "`{$column}` = VALUES(`{$column}`)";
                }
            }
            $updateClause = implode(', ', $updateClause);

            $sql = "INSERT INTO `{$table}` (" . implode(',', array_map(function($col) { return "`{$col}`"; }, $columns)) . ") 
                    VALUES {$allPlaceholders} 
                    ON DUPLICATE KEY UPDATE {$updateClause}";

            error_log("Executing SQL: " . $sql);
            error_log("With values: " . json_encode($values));

            $db = Database::getInstance();
            $db->query($sql, $values);

            return count($rows);
        } catch (Exception $e) {
            error_log("Upsert chunk failed: " . $e->getMessage());
            error_log("SQL: " . $sql ?? 'N/A');
            error_log("Values: " . json_encode($values ?? []));
            throw $e; // Re-throw to be caught by the calling method
        }
    }

    private function getCurrentVersion($tenantId, $table)
    {
        $db = Database::getInstance();
        $stmt = $db->query(
            "SELECT LastVersion FROM sync_versions WHERE TenantId = ? AND TableName = ?",
            [$tenantId, $table]
        );
        
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result ? (int)$result['LastVersion'] : 0;
    }

    private function updateWatermark($tenantId, $table, $version)
    {
        $db = Database::getInstance();
        $db->query(
            "INSERT INTO sync_versions (TenantId, TableName, LastVersion, LastPulledAt) 
             VALUES (?, ?, ?, NOW()) 
             ON DUPLICATE KEY UPDATE LastVersion = VALUES(LastVersion), LastPulledAt = VALUES(LastPulledAt)",
            [$tenantId, $table, $version, $version]
        );
    }

    public function seed($tenantId, $table, $data)
    {
        if (!in_array($table, $this->applyOrder)) {
            throw new InvalidArgumentException("Table {$table} is not allowed for sync");
        }

        $counts = [
            'accepted' => 0,
            'skipped' => 0,
            'errors' => 0
        ];

        $db = Database::getInstance();
        
        try {
            $db->beginTransaction();

            // Clear existing data for this tenant and table
            $db->query("DELETE FROM `{$table}` WHERE tenant_id = ?", [$tenantId]);
            
            // Insert new data
            if (!empty($data)) {
                $counts['accepted'] = $this->processUpserts($tenantId, $table, $data);
            }

            $db->commit();

            // Update watermark to current timestamp
            $this->updateWatermark($tenantId, $table, time());

        } catch (Exception $e) {
            $db->rollback();
            error_log("Seed operation failed: tenant_id={$tenantId}, table={$table}, error=" . $e->getMessage());
            
            $counts['errors'] = count($data);
            $counts['accepted'] = 0;
        }

        return $counts;
    }
}

