<?php
/**
 * Simple Sync Service
 * Simplified version without complex transaction handling
 */

require_once 'config/database.php';

class SimpleSyncService
{
    public function apply($tenantId, $table, $fromVersion, $toVersion, $rows)
    {
        error_log("SimpleSyncService::apply called with tenantId={$tenantId}, table={$table}, fromVersion={$fromVersion}, toVersion={$toVersion}, rows=" . count($rows));
        
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
            
            // Process each row individually without transaction
            foreach ($rows as $row) {
                try {
                    if ($row['op'] === 'delete') {
                        $this->processDelete($db, $tenantId, $table, $row['Id']);
                        $counts['accepted']++;
                    } elseif ($row['op'] === 'upsert') {
                        $this->processUpsert($db, $tenantId, $table, $row);
                        $counts['accepted']++;
                    }
                } catch (Exception $e) {
                    error_log("Error processing row: " . $e->getMessage());
                    $counts['errors']++;
                }
            }
            
            // Update watermark
            $this->updateWatermark($db, $tenantId, $table, $toVersion);
            
        } catch (Exception $e) {
            error_log("SimpleSyncService error: " . $e->getMessage());
            $counts['errors'] = count($rows);
            $counts['accepted'] = 0;
        }

        return $counts;
    }
    
    private function processDelete($db, $tenantId, $table, $id)
    {
        $sql = "DELETE FROM `{$table}` WHERE tenant_id = ? AND Id = ?";
        $db->query($sql, [$tenantId, $id]);
    }
    
    private function processUpsert($db, $tenantId, $table, $row)
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
        
        error_log("Executing SQL: " . $sql);
        error_log("With values: " . json_encode($values));
        
        $db->query($sql, $values);
    }
    
    private function updateWatermark($db, $tenantId, $table, $version)
    {
        $sql = "INSERT INTO sync_versions (TenantId, TableName, LastVersion, LastPulledAt) 
                VALUES (?, ?, ?, NOW()) 
                ON DUPLICATE KEY UPDATE LastVersion = VALUES(LastVersion), LastPulledAt = VALUES(LastPulledAt)";
        $db->query($sql, [$tenantId, $table, $version]);
    }
}
