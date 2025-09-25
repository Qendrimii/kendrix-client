<?php
require_once 'config/database.php';

try {
    $db = Database::getInstance();
    echo "Database connection successful!\n";
    
    // Check if we have any data
    $tables = ['Fatura', 'Blerjet', 'Stoku', 'Subjektet', 'ArtikulliBaze'];
    foreach ($tables as $table) {
        $stmt = $db->query("SELECT COUNT(*) as count FROM `{$table}` WHERE tenant_id = 5");
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        echo $table . ': ' . $result['count'] . ' records' . "\n";
    }
    
    // Check total records in each table
    echo "\nTotal records in each table:\n";
    foreach ($tables as $table) {
        $stmt = $db->query("SELECT COUNT(*) as count FROM `{$table}`");
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        echo $table . ': ' . $result['count'] . ' total records' . "\n";
    }
    
} catch (Exception $e) {
    echo 'Error: ' . $e->getMessage() . "\n";
}
?>
