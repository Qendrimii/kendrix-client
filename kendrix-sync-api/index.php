<?php
/**
 * Kendrix Sync API - PHP 7.4 Compatible
 * Simple and smart data ingestion API
 */

// Enable error reporting for development
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Set content type to JSON
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Tenant-External-Key, X-Idempotency-Key, X-Request-Id');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Include configuration and classes
require_once 'config/database.php';
require_once 'classes/JWT.php';
require_once 'classes/SyncService.php';
require_once 'classes/IdempotencyService.php';
require_once 'classes/Response.php';

try {
    $router = new Router();
    $router->handleRequest();
} catch (Exception $e) {
    $response = new Response();
    $response->error('Internal server error', 500, $e->getMessage());
}

class Router
{
    private $routes = [
        'GET /api/sync/v1/heartbeat' => 'heartbeat',
        'GET /api/sync/v1/contract' => 'contract',
        'POST /api/sync/v1/batch' => 'batch',
        'POST /api/sync/v1/seed' => 'seed'
    ];

    public function handleRequest()
    {
        $method = $_SERVER['REQUEST_METHOD'];
        $path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        $route = $method . ' ' . $path;

        // Debug logging
        error_log("API Request: {$route}");

        // Handle dynamic routes
        if (preg_match('#^POST /api/sync/v1/seed/([^/]+)$#', $route, $matches)) {
            $this->seed($matches[1]);
            return;
        }

        // Check exact route match first
        if (isset($this->routes[$route])) {
            $method = $this->routes[$route];
            $this->$method();
            return;
        }

        // Check for partial matches (for debugging)
        foreach ($this->routes as $pattern => $handler) {
            if (strpos($route, $pattern) !== false) {
                $this->$handler();
                return;
            }
        }

        // If no route matches, return 404
        $response = new Response();
        $response->error('Not found', 404, "Route not found: {$route}");
    }

    private function heartbeat()
    {
        $response = new Response();
        $response->success([
            'status' => 'ok',
            'timestamp' => date('c'),
            'version' => '1.0.0',
            'php_version' => PHP_VERSION,
            'server_time' => date('Y-m-d H:i:s')
        ]);
    }

    private function contract()
    {
        $response = new Response();
        $response->success([
            'tables' => [
                ['name' => 'Subjektet', 'schemaHash' => '1f2a', 'maxRows' => 1000],
                ['name' => 'TVSH', 'schemaHash' => '2b3c', 'maxRows' => 100],
                ['name' => 'Kategoria', 'schemaHash' => '3c4d', 'maxRows' => 500],
                ['name' => 'ArtikulliBaze', 'schemaHash' => '4d5e', 'maxRows' => 2000],
                ['name' => 'Shfrytezuesi', 'schemaHash' => '5e6f', 'maxRows' => 100],
                ['name' => 'FaturaKategoria', 'schemaHash' => '6f7g', 'maxRows' => 100],
                ['name' => 'MenyraPageses', 'schemaHash' => '7g8h', 'maxRows' => 50],
                ['name' => 'Pagesat', 'schemaHash' => '8h9i', 'maxRows' => 1000],
                ['name' => 'Fatura', 'schemaHash' => '9i0j', 'maxRows' => 1000],
                ['name' => 'Porosia', 'schemaHash' => '0j1k', 'maxRows' => 2000],
                ['name' => 'BlerjeKategoria', 'schemaHash' => '1k2l', 'maxRows' => 100],
                ['name' => 'Blerjet', 'schemaHash' => '2l3m', 'maxRows' => 1000],
                ['name' => 'PorositeEBlerjes', 'schemaHash' => '3m4n', 'maxRows' => 2000],
                ['name' => 'Stoku', 'schemaHash' => '4n5o', 'maxRows' => 2000],
                ['name' => 'Normativa', 'schemaHash' => '5o6p', 'maxRows' => 1000],
                ['name' => 'ZRaportet', 'schemaHash' => '6p7q', 'maxRows' => 100]
            ],
            'requiredHeaders' => ['Authorization', 'X-Tenant-External-Key', 'X-Idempotency-Key'],
            'maxBodyBytes' => 2097152,
            'ordering' => [
                'Subjektet', 'TVSH', 'Kategoria', 'ArtikulliBaze', 'Shfrytezuesi',
                'FaturaKategoria', 'MenyraPageses', 'Pagesat', 'Fatura', 'Porosia',
                'BlerjeKategoria', 'Blerjet', 'PorositeEBlerjes', 'Stoku', 'Normativa', 'ZRaportet'
            ]
        ]);
    }

    private function batch()
    {
        // Validate authentication
        $auth = $this->validateAuth();
        if (!$auth) return;

        // Validate tenant
        $tenant = $this->validateTenant();
        if (!$tenant) return;

        // Get request data
        $input = json_decode(file_get_contents('php://input'), true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            $response = new Response();
            $response->error('Invalid JSON', 400, json_last_error_msg());
            return;
        }

        // Validate required fields
        if (!isset($input['table']) || !isset($input['fromVersion']) || !isset($input['toVersion']) || !isset($input['rows'])) {
            $response = new Response();
            $response->error('Missing required fields', 400, 'Required: table, fromVersion, toVersion, rows');
            return;
        }

        // Validate table name
        $allowedTables = [
            'Subjektet', 'TVSH', 'Kategoria', 'ArtikulliBaze', 'Shfrytezuesi',
            'FaturaKategoria', 'MenyraPageses', 'Pagesat', 'Fatura', 'Porosia',
            'BlerjeKategoria', 'Blerjet', 'PorositeEBlerjes', 'Stoku', 'Normativa', 'ZRaportet'
        ];

        if (!in_array($input['table'], $allowedTables)) {
            $response = new Response();
            $response->error('Invalid table name', 400, 'Table must be one of: ' . implode(', ', $allowedTables));
            return;
        }

        // Validate rows array
        if (!is_array($input['rows']) || count($input['rows']) > 500) {
            $response = new Response();
            $response->error('Invalid rows', 400, 'Rows must be an array with maximum 500 items');
            return;
        }

        // Check idempotency
        $idempotencyKey = $_SERVER['HTTP_X_IDEMPOTENCY_KEY'] ?? '';
        $idempotencyService = new IdempotencyService();
        
        if (!$idempotencyService->lock($tenant['Id'], $input['table'], $idempotencyKey)) {
            $response = new Response();
            $response->success([
                'accepted' => 0,
                'skipped' => 0,
                'errors' => 0,
                'duplicate' => true
            ]);
            return;
        }

        // Process batch
        try {
            $syncService = new SyncService();
            $result = $syncService->apply(
                $tenant['Id'],
                $input['table'],
                $input['fromVersion'],
                $input['toVersion'],
                $input['rows']
            );

            $response = new Response();
            $response->success($result);
        } catch (Exception $e) {
            error_log("Batch processing error: " . $e->getMessage());
            $response = new Response();
            $response->error('Batch processing failed', 500, $e->getMessage());
        }
    }

    private function seed($table)
    {
        // Validate authentication
        $auth = $this->validateAuth();
        if (!$auth) return;

        // Validate tenant
        $tenant = $this->validateTenant();
        if (!$tenant) return;

        // Get request data
        $input = json_decode(file_get_contents('php://input'), true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            $response = new Response();
            $response->error('Invalid JSON', 400, json_last_error_msg());
            return;
        }

        // Validate table name
        $allowedTables = [
            'Subjektet', 'TVSH', 'Kategoria', 'ArtikulliBaze', 'Shfrytezuesi',
            'FaturaKategoria', 'MenyraPageses', 'Pagesat', 'Fatura', 'Porosia',
            'BlerjeKategoria', 'Blerjet', 'PorositeEBlerjes', 'Stoku', 'Normativa', 'ZRaportet'
        ];

        if (!in_array($table, $allowedTables)) {
            $response = new Response();
            $response->error('Invalid table name', 400, 'Table must be one of: ' . implode(', ', $allowedTables));
            return;
        }

        // Process seed
        try {
            $syncService = new SyncService();
            $result = $syncService->seed($tenant['Id'], $table, $input);

            $response = new Response();
            $response->success($result);
        } catch (Exception $e) {
            error_log("Seed processing error: " . $e->getMessage());
            $response = new Response();
            $response->error('Seed processing failed', 500, $e->getMessage());
        }
    }

    private function validateAuth()
    {
        $authHeader = $_SERVER['HTTP_AUTHORIZATION'] ?? '';
        
        if (!preg_match('/Bearer\s+(.*)$/i', $authHeader, $matches)) {
            $response = new Response();
            $response->error('Missing or invalid authorization header', 401, 'Expected: Authorization: Bearer <token>');
            return false;
        }

        $token = $matches[1];
        $jwt = new JWT();
        
        if (!$jwt->validate($token)) {
            $response = new Response();
            $response->error('Invalid token', 401, 'JWT token validation failed');
            return false;
        }

        return true;
    }

    private function validateTenant()
    {
        $externalKey = $_SERVER['HTTP_X_TENANT_EXTERNAL_KEY'] ?? '';
        
        if (empty($externalKey)) {
            $response = new Response();
            $response->error('Missing tenant external key', 400, 'Required header: X-Tenant-External-Key');
            return false;
        }

        try {
            $db = Database::getInstance();
            $stmt = $db->query(
                "SELECT Id, Name, ExternalKey, Status FROM tenants WHERE ExternalKey = ? AND Status = 'active'",
                [$externalKey]
            );
            $tenant = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$tenant) {
                $response = new Response();
                $response->error('Tenant not found', 404, "No active tenant found with key: {$externalKey}");
                return false;
            }

            return $tenant;
        } catch (Exception $e) {
            error_log("Tenant validation error: " . $e->getMessage());
            $response = new Response();
            $response->error('Database error', 500, 'Failed to validate tenant');
            return false;
        }
    }
}