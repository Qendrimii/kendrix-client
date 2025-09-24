<?php
/**
 * Health Check Endpoint - No Authentication Required
 */

header('Content-Type: application/json');

$response = [
    'status' => 'ok',
    'timestamp' => date('c'),
    'version' => '1.0.0',
    'php_version' => PHP_VERSION,
    'server_time' => date('Y-m-d H:i:s'),
    'endpoints' => [
        'health' => '/health.php',
        'heartbeat' => '/api/sync/v1/heartbeat',
        'contract' => '/api/sync/v1/contract',
        'batch' => '/api/sync/v1/batch',
        'seed' => '/api/sync/v1/seed/{table}'
    ]
];

// Test database connection
try {
    require_once 'config/database.php';
    $db = Database::getInstance();
    $db->query("SELECT 1");
    $response['database'] = 'connected';
} catch (Exception $e) {
    $response['database'] = 'error';
    $response['database_error'] = $e->getMessage();
}

echo json_encode($response, JSON_PRETTY_PRINT);

