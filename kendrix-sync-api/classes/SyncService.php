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
            error_log("Starting sync processing for table: {$table}");
            
            // Process deletes first
            $deleteIds = array_column(array_filter($rows, function($r) { return $r['op'] === 'delete'; }), 'Id');
            if (!empty($deleteIds)) {
                error_log("Processing deletes: " . json_encode($deleteIds));
                $deleted = $this->processDeletes($tenantId, $table, $deleteIds);
                $counts['accepted'] += $deleted;
            }

            // Process upserts
            $upsertRows = array_filter($rows, function($r) { return $r['op'] === 'upsert'; });
            if (!empty($upsertRows)) {
                error_log("Processing upserts: " . count($upsertRows) . " rows");
                $upserted = $this->processUpserts($tenantId, $table, $upsertRows);
                $counts['accepted'] += $upserted;
            }

            // Update watermark
            $this->updateWatermark($tenantId, $table, $toVersion);
            
            error_log("Sync processing completed successfully");

        } catch (Exception $e) {
            error_log("Sync processing failed: tenant_id={$tenantId}, table={$table}, error=" . $e->getMessage());
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
        
        // Process each row individually for better error handling
        foreach ($rows as $row) {
            try {
                $this->processUpsertRow($tenantId, $table, $row);
                $upserted++;
            } catch (Exception $e) {
                error_log("Error processing upsert row: " . $e->getMessage());
                error_log("Row data: " . json_encode($row));
            }
        }

        return $upserted;
    }

    private function processUpsertRow($tenantId, $table, $row)
    {
        $db = Database::getInstance();
        
        // Remove 'op' column
        unset($row['op']);
        
        // Add tenant_id
        $row['tenant_id'] = $tenantId;
        
        // Define known table structures
        $tableStructures = [
            'Subjektet' => ['tenant_id', 'Id', 'Kodi', 'Emertimi', 'Furnitor', 'Bleres', 'NrUnik', 'NoFiskal', 'NoTVSH', 'NIB', 'Adresa', 'Telefoni', 'Email', 'Rabati', 'Pershkrimi', 'KontojaArketueshme', 'KontojaPagueshme', 'Limiti', 'Fshire', 'DataEKrijimit', 'DataEModifikimit'],
            'TVSH' => ['tenant_id', 'Id', 'DataEKrijimit', 'DataEModifikimit', 'Fshire', 'Perqindja', 'Grupi'],
            'Kategoria' => ['tenant_id', 'Id', 'Emri', 'Color', 'Printer', 'Lloji', 'EmriNePrinter', 'DataEKrijimit', 'DataEModifikimit'],
            'ArtikulliBaze' => ['tenant_id', 'Id', 'Artikull', 'Sherbim', 'Shifra', 'Emri', 'Njesia', 'Barkodi', 'Cmimi_I_Shitjes_Cope', 'Cmimi_I_Shitjes_Pako', 'SasiaPako', 'KategoriaId', 'Aktiv', 'ArtikullIPerbere', 'EmriGjenerik', 'Prodhuesi', 'ArtNgaPeshorja', 'DataEKrijimit', 'DataEModifikimit', 'TvshId', 'EmertimiiDyte', 'PeshaNeto', 'PeshaBruto', 'Gjatesia', 'Gjersia', 'Lartesia', 'SasiaMinimale', 'SasiaMaksimale', 'Afatshkurte', 'Afatgjate', 'NormaZhvleresimit', 'DataEFillimitTeZhvlersimit', 'TempId', 'Skadimi', 'Ambalazhi', 'IRimbursueshem', 'OrigjinaEMallit', 'KostoEProdhimit', 'Rafti', 'KodiDoganor', 'SubjektiId', 'IncomeAccountId', 'ExpenseAccountId', 'IsGroup', 'GroupId'],
            'Shfrytezuesi' => ['tenant_id', 'Id', 'DataEKrijimit', 'DataEModifikimit', 'Fshire', 'Username', 'Email', 'Tel', 'Aktiv', 'Color', 'RoleId', 'PunetoriId'],
            'FaturaKategoria' => ['tenant_id', 'Id', 'Emri', 'Kodi', 'Pershkrimi', 'TvshId', 'DataEKrijimit', 'DataEModifikimit', 'Fshire'],
            'BlerjeKategoria' => ['tenant_id', 'Id', 'Emri', 'Kodi', 'Pershkrimi', 'TvshId', 'DataEKrijimit', 'DataEModifikimit', 'Fshire'],
            'MenyraPageses' => ['tenant_id', 'Id', 'Kodi', 'Emertimi', 'Kontoja', 'FiskalType', 'PosEnabled', 'DataEKrijimit', 'DataEModifikimit', 'POSBorgji', 'KontojaKalimtare', 'KontimneKontoKalimtare', 'KontojaeProvizioneve', 'BankaId', 'JoFiskal'],
            'Pagesat' => ['tenant_id', 'Id', 'DataPageses', 'MenyraPagesesId', 'Totali', 'ShumaPaguar', 'ArkaId', 'BankaId', 'Referenca', 'Komenti', 'Memo', 'KrijuarNga', 'DataEModifikimit', 'Valuta', 'KursiKembimit'],
            'Fatura' => ['tenant_id', 'Id', 'Data', 'Fshire', 'ShfrytezuesiId', 'NrFatures', 'AfatiPageses', 'Staff', 'FaturaKategoriaId', 'DataEKrijimit', 'DataEModifikimit', 'KodiValues', 'KursiKembimit', 'SubjektiId', 'StatusFatureId', 'PagesaId', 'Comment'],
            'Porosia' => ['tenant_id', 'Id', 'DataEKrijimit', 'DataEModifikimit', 'Fshire', 'FaturaId', 'ProduktiId', 'Cmimi', 'Sasia', 'Rabati', 'IdTavolina', 'Aktive', 'ShfrytezuesiId', 'Tvsh'],
            'Blerjet' => ['tenant_id', 'Id', 'DataEFatures', 'DataEKrijimit', 'DataEModifikimit', 'Fshire', 'NrFatures', 'AfatiPageses', 'BlerjeKategoriaId', 'NumriFaturesSeFurnitorit', 'Fatura', 'Staff', 'SubjektiId', 'PagesaId', 'StatusFatureId', 'OptimisticLockField', 'fTotalPorosias', 'fTotalVAT', 'TotalPorosias', 'TotalVAT', 'ArkaId', 'MenyraPagesesId'],
            'PorositeEBlerjes' => ['tenant_id', 'Id', 'ProduktiId', 'Sasia', 'CmimiNjesi', 'DataEKrijimit', 'DataEModifikimit', 'Fshire', 'BlerjaId', 'PorosiaDate', 'Tvsh', 'Rabati', 'Total'],
            'Stoku' => ['tenant_id', 'Id', 'ProduktiId', 'Sasia', 'LevelIRenditjes', 'DataEKrijimit', 'DataEModifikimit', 'Fshire', 'Lokacioni'],
            'Normativa' => ['tenant_id', 'Id', 'ArtikulliBazeId', 'Norma', 'DataEKrijimit', 'DataEModifikimit'],
            'ZRaportet' => ['tenant_id', 'Id', 'DataEKrijimit', 'DataEModifikimit', 'ShumaShitjeProgram', 'ShumaNeZRaport'],
            'Tavolina' => ['tenant_id', 'Id', 'DataEKrijimit', 'DataEModifikimit', 'Fshire', 'Emri', 'SallaId', 'ShfrytezuesiId', 'Statusi', 'RestTableX', 'RestTableY', 'SizeX', 'SizeY', 'RegDate', 'TableColorR', 'TableColorG', 'TableColorB']
        ];
        
        // Get valid columns for this table
        $validColumns = $tableStructures[$table] ?? [];
        if (empty($validColumns)) {
            error_log("Unknown table structure for: {$table}");
            // Fall back to using all provided columns
            $validColumns = array_keys($row);
        }
        
        error_log("Valid columns for {$table}: " . json_encode($validColumns));
        error_log("Input row columns: " . json_encode(array_keys($row)));
        
        // Filter row to only include valid columns
        $filteredRow = [];
        foreach ($row as $column => $value) {
            if (in_array($column, $validColumns)) {
                $filteredRow[$column] = $value;
            } else {
                error_log("Skipping invalid column '{$column}' for table '{$table}'");
            }
        }
        
        error_log("Filtered row: " . json_encode($filteredRow));
        
        if (empty($filteredRow)) {
            throw new Exception("No valid columns found for table {$table}");
        }
        
        // Get all columns and values
        $columns = array_keys($filteredRow);
        $placeholders = str_repeat('?,', count($columns) - 1) . '?';
        $values = array_values($filteredRow);
        
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
        
        error_log("Executing upsert SQL: " . $sql);
        error_log("With values: " . json_encode($values));
        error_log("UPDATED CODE VERSION - processUpsertRow method");
        
        $db->query($sql, $values);
    }
    
    private function getTableColumns($table)
    {
        static $tableColumns = [];
        
        if (!isset($tableColumns[$table])) {
            try {
                $db = Database::getInstance();
                $stmt = $db->query("DESCRIBE `{$table}`");
                $columns = $stmt->fetchAll(PDO::FETCH_COLUMN);
                $tableColumns[$table] = $columns;
                error_log("Loaded columns for {$table}: " . json_encode($columns));
            } catch (Exception $e) {
                error_log("Failed to get columns for {$table}: " . $e->getMessage());
                // Return empty array if we can't get columns
                $tableColumns[$table] = [];
            }
        }
        
        return $tableColumns[$table];
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
        try {
            $db = Database::getInstance();
            $stmt = $db->query(
                "SELECT LastVersion FROM sync_versions WHERE TenantId = ? AND TableName = ?",
                [$tenantId, $table]
            );
            
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result ? (int)$result['LastVersion'] : 0;
        } catch (Exception $e) {
            error_log("getCurrentVersion failed: " . $e->getMessage());
            // Return 0 if table doesn't exist or other error
            return 0;
        }
    }

    private function updateWatermark($tenantId, $table, $version)
    {
        try {
            $db = Database::getInstance();
            $db->query(
                "INSERT INTO sync_versions (TenantId, TableName, LastVersion, LastPulledAt) 
                 VALUES (?, ?, ?, NOW()) 
                 ON DUPLICATE KEY UPDATE LastVersion = VALUES(LastVersion), LastPulledAt = VALUES(LastPulledAt)",
                [$tenantId, $table, $version]
            );
        } catch (Exception $e) {
            error_log("updateWatermark failed: " . $e->getMessage());
            // Continue without watermark update if table doesn't exist
        }
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

