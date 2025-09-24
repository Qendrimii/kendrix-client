<?php
/**
 * Idempotency Service for preventing duplicate processing
 */

class IdempotencyService
{
    public function lock($tenantId, $table, $key)
    {
        if (empty($key)) {
            return false;
        }

        $keyHash = hash('sha256', $key);

        try {
            $db = Database::getInstance();
            
            // Try to insert into database
            $stmt = $db->query(
                "INSERT INTO idempotency_keys (TenantId, TableName, KeyHash, CreatedAt) VALUES (?, ?, ?, NOW())",
                [$tenantId, $table, $keyHash]
            );

            return true;

        } catch (PDOException $e) {
            // If insert fails due to duplicate key, it means we've seen this before
            if (strpos($e->getMessage(), 'Duplicate entry') !== false) {
                error_log("Duplicate idempotency key detected: tenant_id={$tenantId}, table={$table}, key_hash={$keyHash}");
                return false;
            }

            error_log("Idempotency key check failed: tenant_id={$tenantId}, table={$table}, error=" . $e->getMessage());
            // If table doesn't exist or other error, allow processing to continue
            return true;
        } catch (Exception $e) {
            error_log("IdempotencyService::lock failed: " . $e->getMessage());
            // If table doesn't exist or other error, allow processing to continue
            return true;
        }

        return false;
    }

    public function cleanup($hoursOld = 24)
    {
        $cutoff = date('Y-m-d H:i:s', time() - ($hoursOld * 3600));
        
        $db = Database::getInstance();
        $stmt = $db->query(
            "DELETE FROM idempotency_keys WHERE CreatedAt < ?",
            [$cutoff]
        );

        $deleted = $stmt->rowCount();
        error_log("Cleaned up old idempotency keys: deleted_count={$deleted}, cutoff_time={$cutoff}");

        return $deleted;
    }
}

