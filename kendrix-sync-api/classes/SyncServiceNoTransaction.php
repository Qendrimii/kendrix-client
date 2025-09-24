<?php
/**
 * Sync Service Without Transactions
 * Simplified version for debugging
 */

require_once 'config/database.php';

class SyncServiceNoTransaction
{
    private $applyOrder = [
        'Subjektet', 'TVSH', 'Kategoria', 'ArtikulliBaze', 'Shfrytezuesi',
        'FaturaKategoria', 'MenyraPageses', 'Pagesat', 'Fatura', 'Porosia',
        'BlerjeKategoria', 'Blerjet', 'PorositeEBlerjes', 'Stoku', 'Normativa', 'ZRaportet'
    ];

    public function apply($tenantId, $table, $fromVersion, $toVersion, $rows)
    {
        error_log("SyncServiceNoTransaction::apply called with tenantId={$tenantId}, table={$table}, fromVersion={$fromVersion}, toVersion={$toVersion}, rows=" . count($rows));
        
        // Validate table is in allowed list
        if (!in_array($table, $this->applyOrder)) {
            throw new InvalidArgumentException("Table {$table} is not allowed for sync");
        }

        $counts = [
            'accepted' => 0,
            'skipped' => 0,
            'errors' => 0
        ];

        if (empty($rows)) {
            error_log("No rows to process, returning empty counts");
            return $counts;
        }

        try {
            $db = Database::getInstance();
            error_log("Database instance obtained");
            
            // Process deletes first
            $deleteIds = array_column(array_filter($rows, function($r) { return $r['op'] === 'delete'; }), 'Id');
            error_log("Delete IDs: " . json_encode($deleteIds));
            if (!empty($deleteIds)) {
                error_log("Processing deletes");
                $deleted = $this->processDeletes($db, $tenantId, $table, $deleteIds);
                error_log("Deleted count: " . $deleted);
                $counts['accepted'] += $deleted;
            }

            // Process upserts
            $upsertRows = array_filter($rows, function($r) { return $r['op'] === 'upsert'; });
            error_log("Upsert rows count: " . count($upsertRows));
            if (!empty($upsertRows)) {
                error_log("Processing upserts");
                $upserted = $this->processUpserts($db, $tenantId, $table, $upsertRows);
                error_log("Upserted count: " . $upserted);
                $counts['accepted'] += $upserted;
            }

            // Update watermark
            $this->updateWatermark($db, $tenantId, $table, $toVersion);
            
        } catch (Exception $e) {
            error_log("SyncServiceNoTransaction error: " . $e->getMessage());
            error_log("Stack trace: " . $e->getTraceAsString());
            $counts['errors'] = count($rows);
            $counts['accepted'] = 0;
            $counts['error_details'] = $e->getMessage();
        }

        return $counts;
    }

    private function processDeletes($db, $tenantId, $table, $ids)
    {
        if (empty($ids)) {
            return 0;
        }

        $placeholders = str_repeat('?,', count($ids) - 1) . '?';
        $params = array_merge([$tenantId], $ids);
        
        $sql = "DELETE FROM `{$table}` WHERE tenant_id = ? AND Id IN ({$placeholders})";
        error_log("Delete SQL: " . $sql);
        error_log("Delete params: " . json_encode($params));
        
        $stmt = $db->query($sql, $params);
        return $stmt->rowCount();
    }

    private function processUpserts($db, $tenantId, $table, $rows)
    {
        if (empty($rows)) {
            return 0;
        }

        $upserted = 0;
        
        // Process each row individually
        foreach ($rows as $row) {
            try {
                $upserted += $this->processUpsertRow($db, $tenantId, $table, $row);
            } catch (Exception $e) {
                error_log("Error processing upsert row: " . $e->getMessage());
                error_log("Row data: " . json_encode($row));
            }
        }

        return $upserted;
    }

    private function processUpsertRow($db, $tenantId, $table, $row)
    {
        // Remove 'op' column
        unset($row['op']);
        
        // Add tenant_id
        $row['tenant_id'] = $tenantId;
        
        $columns = array_keys($row);
        $placeholders = str_repeat('?,', count($columns) - 1) . '?';
        $values = array_values($row);
        
        // Build ON DUPLICATE KEY UPDATE clause
        $updateClause = [];
        foreach ($columns as $column) {
            if ($column !== 'tenant_id' && $column !== 'Id') {
                $updateClause[] = "`{$column}` = VALUES(`{$column}`)";
            }
        }
        $updateClause = implode(', ', $updateClause);
        
        $sql = "INSERT INTO `{$table}` (" . implode(',', array_map(function($col) { return "`{$col}`"; }, $columns)) . ") 
                VALUES ({$placeholders}) 
                ON DUPLICATE KEY UPDATE {$updateClause}";
        
        error_log("Upsert SQL: " . $sql);
        error_log("Upsert values: " . json_encode($values));
        
        $db->query($sql, $values);
        return 1;
    }

    private function updateWatermark($db, $tenantId, $table, $version)
    {
        $sql = "INSERT INTO sync_versions (TenantId, TableName, LastVersion, LastPulledAt) 
                VALUES (?, ?, ?, NOW()) 
                ON DUPLICATE KEY UPDATE LastVersion = VALUES(LastVersion), LastPulledAt = VALUES(LastPulledAt)";
        $db->query($sql, [$tenantId, $table, $version]);
    }
}
