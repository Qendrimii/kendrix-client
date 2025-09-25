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
    private $pdo;
    
    public function __construct()
    {
        $this->pdo = Database::getInstance();
    }
    
    private $routes = [
        'GET /api/sync/v1/heartbeat' => 'heartbeat',
        'GET /api/sync/v1/contract' => 'contract',
        'POST /api/sync/v1/batch' => 'batch',
        'POST /api/sync/v1/seed' => 'seed',
        // Mobile API endpoints
        'POST /api/mobile/v1/auth/login' => 'mobileLogin',
        'POST /api/mobile/v1/auth/refresh' => 'mobileRefreshToken',
        'GET /api/mobile/v1/auth/profile' => 'mobileGetProfile',
        'GET /api/mobile/v1/artikulli' => 'mobileGetArtikulli',
        'GET /api/mobile/v1/fatura' => 'mobileGetFatura',
        'GET /api/mobile/v1/blerjet' => 'mobileGetBlerjet',
        'GET /api/mobile/v1/stoku' => 'mobileGetStoku',
        'GET /api/mobile/v1/subjektet' => 'mobileGetSubjektet',
        'GET /api/mobile/v1/dashboard/stats' => 'mobileGetDashboardStats',
        // Additional table endpoints
        'GET /api/mobile/v1/fatura-kategoria' => 'mobileGetFaturaKategoria',
        'GET /api/mobile/v1/blerje-kategoria' => 'mobileGetBlerjeKategoria',
        'GET /api/mobile/v1/kategoria' => 'mobileGetKategoria',
        'GET /api/mobile/v1/menyra-pageses' => 'mobileGetMenyraPageses',
        'GET /api/mobile/v1/pagesat' => 'mobileGetPagesat',
        'GET /api/mobile/v1/porosia' => 'mobileGetPorosia',
        'GET /api/mobile/v1/porosite-e-blerjes' => 'mobileGetPorositeEBlerjes',
        'GET /api/mobile/v1/shfrytezuesi' => 'mobileGetShfrytezuesi',
        'GET /api/mobile/v1/tavolina' => 'mobileGetTavolina',
        'GET /api/mobile/v1/tvsh' => 'mobileGetTVSH',
        'GET /api/mobile/v1/normativa' => 'mobileGetNormativa',
        'GET /api/mobile/v1/zraportet' => 'mobileGetZRaportet',
        // Generic paginated entities endpoint
        'GET /api/mobile/v1/entities' => 'mobileGetEntities'
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
        
        $payload = $jwt->decode($token);
        if (!$payload || !$jwt->validate($token)) {
            $response = new Response();
            $response->error('Invalid token', 401, 'JWT token validation failed');
            return false;
        }

        return $payload;
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

    // Mobile API Methods
    private function mobileLogin()
    {
        error_log("Mobile login endpoint called");
        
        $input = json_decode(file_get_contents('php://input'), true);
        error_log("Input received: " . json_encode($input));
        
        if (json_last_error() !== JSON_ERROR_NONE) {
            error_log("JSON decode error: " . json_last_error_msg());
            $response = new Response();
            $response->error('Invalid JSON', 400, json_last_error_msg());
            return;
        }

        $email = $input['email'] ?? '';
        $password = $input['password'] ?? '';
        $tenantKey = $input['tenant_key'] ?? '';

        error_log("Login attempt: email=$email, tenant_key=$tenantKey");

        if (empty($email) || empty($password) || empty($tenantKey)) {
            error_log("Missing required fields");
            $response = new Response();
            $response->error('Missing required fields', 400, 'Email, password, and tenant_key are required');
            return;
        }

        try {
            // Validate tenant
            error_log("Validating tenant with key: $tenantKey");
            $tenant = $this->validateTenantByKey($tenantKey);
            if (!$tenant) {
                error_log("Tenant validation failed");
                $response = new Response();
                $response->error('Invalid tenant', 401, 'Invalid tenant key');
                return;
            }
            error_log("Tenant validated: " . json_encode($tenant));

            // Check user credentials
            error_log("Looking up user: $email");
            $stmt = $this->pdo->query("SELECT * FROM users WHERE Email = ?", [$email]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$user) {
                error_log("User not found: $email");
                $response = new Response();
                $response->error('Invalid credentials', 401, 'Invalid email or password');
                return;
            }
            
            error_log("User found: " . json_encode($user));
            
            if (!password_verify($password, $user['PasswordHash'])) {
                error_log("Password verification failed");
                $response = new Response();
                $response->error('Invalid credentials', 401, 'Invalid email or password');
                return;
            }

            // Generate JWT token
            error_log("Generating JWT token");
            $jwt = new JWT();
            $token = $jwt->encode([
                'sub' => 'user',
                'user_id' => $user['Id'],
                'email' => $user['Email'],
                'tenant_id' => $tenant['Id'],
                'iat' => time(),
                'exp' => time() + 3600 // 1 hour
            ]);
            error_log("JWT token generated: " . substr($token, 0, 50) . "...");

            $responseData = [
                'access_token' => $token,
                'refresh_token' => $token, // For simplicity, using same token
                'user' => [
                    'id' => $user['Id'],
                    'email' => $user['Email'],
                    'display_name' => $user['DisplayName']
                ],
                'tenant' => [
                    'id' => $tenant['Id'],
                    'name' => $tenant['Name']
                ]
            ];
            
            error_log("Sending response: " . json_encode($responseData));
            
            $response = new Response();
            $response->success($responseData);
        } catch (Exception $e) {
            error_log("Login error: " . $e->getMessage());
            $response = new Response();
            $response->error('Login failed', 500, $e->getMessage());
        }
    }

    private function mobileRefreshToken()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        // For simplicity, return the same token
        $response = new Response();
        $response->success([
            'access_token' => $auth['token']
        ]);
    }

    private function mobileGetProfile()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM users WHERE Id = ?", [$auth['user_id']]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$user) {
                $response = new Response();
                $response->error('User not found', 404, 'User not found');
                return;
            }

            $response = new Response();
            $response->success([
                'id' => $user['Id'],
                'email' => $user['Email'],
                'display_name' => $user['DisplayName']
            ]);
        } catch (Exception $e) {
            error_log("Profile error: " . $e->getMessage());
            $response = new Response();
            $response->error('Profile fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetArtikulli()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM ArtikulliBaze WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("Artikulli fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetFatura()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM Fatura WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("Fatura fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetBlerjet()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM Blerjet WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("Blerjet fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetStoku()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM Stoku WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("Stoku fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetSubjektet()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM Subjektet WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("Subjektet fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetDashboardStats()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            // Test database connection first
            $testStmt = $this->pdo->query("SELECT 1 as test");
            $testResult = $testStmt->fetch(PDO::FETCH_ASSOC);
            if (!$testResult) {
                throw new Exception("Database connection test failed");
            }
            
            // Get today's date for filtering
            $today = date('Y-m-d');
            $thisMonth = date('Y-m');
            
            // Today's stats
            $todayStats = [
                'SalesNet' => 0.0,
                'SalesVat' => 0.0,
                'InvoiceCount' => 0,
                'PurchaseCount' => 0,
            ];
            
            // Monthly stats
            $monthlyStats = [
                'monthlyRevenue' => 0.0,
                'avgTicket' => 0.0,
                'totalInvoices' => 0,
                'totalPurchases' => 0,
            ];
            
            // Get today's sales from Fatura
            try {
                // First try with today's date filter
                $stmt = $this->pdo->query("
                    SELECT 
                        COUNT(*) as invoice_count,
                        COALESCE(SUM(Totali), 0) as total_sales,
                        COALESCE(SUM(Totali * 0.2), 0) as total_vat
                    FROM Fatura 
                    WHERE tenant_id = ? AND DATE(Data) = ?
                ", [$tenant['Id'], $today]);
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                
                // If no data for today, get all data for this tenant
                if ($result['invoice_count'] == 0) {
                    $stmt = $this->pdo->query("
                        SELECT 
                            COUNT(*) as invoice_count,
                            COALESCE(SUM(Totali), 0) as total_sales,
                            COALESCE(SUM(Totali * 0.2), 0) as total_vat
                        FROM Fatura 
                        WHERE tenant_id = ?
                    ", [$tenant['Id']]);
                    $result = $stmt->fetch(PDO::FETCH_ASSOC);
                }
                
                $todayStats['InvoiceCount'] = (int)$result['invoice_count'];
                $todayStats['SalesNet'] = (float)$result['total_sales'];
                $todayStats['SalesVat'] = (float)$result['total_vat'];
                
                error_log("Today's sales query result: " . json_encode($result));
            } catch (Exception $e) {
                error_log("Today's sales query failed: " . $e->getMessage());
                // Set default values if query fails
                $todayStats['InvoiceCount'] = 0;
                $todayStats['SalesNet'] = 0.0;
                $todayStats['SalesVat'] = 0.0;
            }
            
            // Get today's purchases from Blerjet
            try {
                // First try with today's date filter
                $stmt = $this->pdo->query("
                    SELECT COUNT(*) as purchase_count
                    FROM Blerjet 
                    WHERE tenant_id = ? AND DATE(DataEFatures) = ?
                ", [$tenant['Id'], $today]);
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                
                // If no data for today, get all data for this tenant
                if ($result['purchase_count'] == 0) {
                    $stmt = $this->pdo->query("
                        SELECT COUNT(*) as purchase_count
                        FROM Blerjet 
                        WHERE tenant_id = ?
                    ", [$tenant['Id']]);
                    $result = $stmt->fetch(PDO::FETCH_ASSOC);
                }
                
                $todayStats['PurchaseCount'] = (int)$result['purchase_count'];
                error_log("Today's purchases query result: " . json_encode($result));
            } catch (Exception $e) {
                error_log("Today's purchases query failed: " . $e->getMessage());
                $todayStats['PurchaseCount'] = 0;
            }
            
            // Get monthly stats
            try {
                // First try with this month's filter
                $stmt = $this->pdo->query("
                    SELECT 
                        COUNT(*) as total_invoices,
                        COALESCE(SUM(Totali), 0) as monthly_revenue,
                        COALESCE(AVG(Totali), 0) as avg_ticket
                    FROM Fatura 
                    WHERE tenant_id = ? AND DATE_FORMAT(Data, '%Y-%m') = ?
                ", [$tenant['Id'], $thisMonth]);
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                
                // If no data for this month, get all data for this tenant
                if ($result['total_invoices'] == 0) {
                    $stmt = $this->pdo->query("
                        SELECT 
                            COUNT(*) as total_invoices,
                            COALESCE(SUM(Totali), 0) as monthly_revenue,
                            COALESCE(AVG(Totali), 0) as avg_ticket
                        FROM Fatura 
                        WHERE tenant_id = ?
                    ", [$tenant['Id']]);
                    $result = $stmt->fetch(PDO::FETCH_ASSOC);
                }
                
                $monthlyStats['totalInvoices'] = (int)$result['total_invoices'];
                $monthlyStats['monthlyRevenue'] = (float)$result['monthly_revenue'];
                $monthlyStats['avgTicket'] = (float)$result['avg_ticket'];
                error_log("Monthly stats query result: " . json_encode($result));
            } catch (Exception $e) {
                error_log("Monthly stats query failed: " . $e->getMessage());
                $monthlyStats['totalInvoices'] = 0;
                $monthlyStats['monthlyRevenue'] = 0.0;
                $monthlyStats['avgTicket'] = 0.0;
            }
            
            // Get monthly purchases
            try {
                // First try with this month's filter
                $stmt = $this->pdo->query("
                    SELECT COUNT(*) as total_purchases
                    FROM Blerjet 
                    WHERE tenant_id = ? AND DATE_FORMAT(DataEFatures, '%Y-%m') = ?
                ", [$tenant['Id'], $thisMonth]);
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                
                // If no data for this month, get all data for this tenant
                if ($result['total_purchases'] == 0) {
                    $stmt = $this->pdo->query("
                        SELECT COUNT(*) as total_purchases
                        FROM Blerjet 
                        WHERE tenant_id = ?
                    ", [$tenant['Id']]);
                    $result = $stmt->fetch(PDO::FETCH_ASSOC);
                }
                
                $monthlyStats['totalPurchases'] = (int)$result['total_purchases'];
                error_log("Monthly purchases query result: " . json_encode($result));
            } catch (Exception $e) {
                error_log("Monthly purchases query failed: " . $e->getMessage());
                $monthlyStats['totalPurchases'] = 0;
            }
            
            // Get recent invoices (last 5)
            try {
                $stmt = $this->pdo->query("
                    SELECT Id, NrFatures, Totali, Data, SubjektiId
                    FROM Fatura 
                    WHERE tenant_id = ? 
                    ORDER BY Data DESC 
                    LIMIT 5
                ", [$tenant['Id']]);
                $recentInvoices = $stmt->fetchAll(PDO::FETCH_ASSOC);
                error_log("Recent invoices query result: " . json_encode($recentInvoices));
            } catch (Exception $e) {
                error_log("Recent invoices query failed: " . $e->getMessage());
                $recentInvoices = [];
            }
            
            // Get low stock items (quantity < 10)
            try {
                $stmt = $this->pdo->query("
                    SELECT s.Id, s.Sasia, ab.Emri as ProductName
                    FROM Stoku s
                    JOIN ArtikulliBaze ab ON s.ProduktiId = ab.Id
                    WHERE s.tenant_id = ? AND s.Sasia < 10
                    ORDER BY s.Sasia ASC
                    LIMIT 10
                ", [$tenant['Id']]);
                $lowStock = $stmt->fetchAll(PDO::FETCH_ASSOC);
                error_log("Low stock query result: " . json_encode($lowStock));
            } catch (Exception $e) {
                error_log("Low stock query failed: " . $e->getMessage());
                $lowStock = [];
            }
            
            $stats = [
                'today' => $todayStats,
                'monthly' => $monthlyStats,
                'recentInvoices' => $recentInvoices,
                'lowStock' => $lowStock,
            ];

            error_log("Dashboard stats generated: " . json_encode($stats));
            
            $response = new Response();
            $response->success($stats);
        } catch (Exception $e) {
            error_log("Dashboard stats error: " . $e->getMessage());
            $response = new Response();
            $response->error('Failed to get dashboard stats', 500, $e->getMessage());
        }
    }

    private function validateTenantByKey($tenantKey)
    {
        try {
            $stmt = $this->pdo->query("SELECT * FROM tenants WHERE ExternalKey = ? AND Status = 'active'", [$tenantKey]);
            $tenant = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$tenant) {
                return false;
            }

            return $tenant;
        } catch (Exception $e) {
            error_log("Tenant validation error: " . $e->getMessage());
            return false;
        }
    }

    // Additional table endpoints
    private function mobileGetFaturaKategoria()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM FaturaKategoria WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("FaturaKategoria fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetBlerjeKategoria()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM BlerjeKategoria WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("BlerjeKategoria fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetKategoria()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM Kategoria WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("Kategoria fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetMenyraPageses()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM MenyraPageses WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("MenyraPageses fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetPagesat()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM Pagesat WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("Pagesat fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetPorosia()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM Porosia WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("Porosia fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetPorositeEBlerjes()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM PorositeEBlerjes WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("PorositeEBlerjes fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetShfrytezuesi()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM Shfrytezuesi WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("Shfrytezuesi fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetTavolina()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM Tavolina WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("Tavolina fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetTVSH()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM TVSH WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("TVSH fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetNormativa()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM Normativa WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("Normativa fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetZRaportet()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        try {
            $stmt = $this->pdo->query("SELECT * FROM ZRaportet WHERE tenant_id = ? ORDER BY Id", [$tenant['Id']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $response = new Response();
            $response->success($data);
        } catch (Exception $e) {
            error_log("ZRaportet fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }

    private function mobileGetEntities()
    {
        $auth = $this->validateAuth();
        if (!$auth) return;

        $tenant = $this->validateTenant();
        if (!$tenant) return;

        // Get query parameters
        $table = $_GET['table'] ?? '';
        $page = (int)($_GET['page'] ?? 1);
        $limit = (int)($_GET['limit'] ?? 25);
        $search = $_GET['search'] ?? '';

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

        // Validate pagination parameters
        if ($page < 1) $page = 1;
        if ($limit < 1 || $limit > 100) $limit = 25;

        try {
            // Calculate offset
            $offset = ($page - 1) * $limit;

            // Build base query
            $countQuery = "SELECT COUNT(*) as total FROM {$table} WHERE tenant_id = ?";
            $dataQuery = "SELECT * FROM {$table} WHERE tenant_id = ?";
            $params = [$tenant['Id']];

            // Add search functionality if provided
            if (!empty($search)) {
                // Get table columns for search (simplified approach)
                $searchConditions = [];
                
                // Common searchable fields - add more as needed
                $searchableFields = ['Emri', 'Pershkrimi', 'Kodi', 'NrFatures', 'DisplayName', 'Email', 'Name'];
                
                foreach ($searchableFields as $field) {
                    $searchConditions[] = "{$field} LIKE ?";
                }
                
                if (!empty($searchConditions)) {
                    $searchClause = " AND (" . implode(' OR ', $searchConditions) . ")";
                    $countQuery .= $searchClause;
                    $dataQuery .= $searchClause;
                    
                    // Add search parameters for each condition
                    $searchParam = "%{$search}%";
                    for ($i = 0; $i < count($searchConditions); $i++) {
                        $params[] = $searchParam;
                    }
                }
            }

            // Add ordering and pagination to data query
            $dataQuery .= " ORDER BY Id LIMIT {$limit} OFFSET {$offset}";

            // Get total count
            $countStmt = $this->pdo->query($countQuery, $params);
            $countResult = $countStmt->fetch(PDO::FETCH_ASSOC);
            $totalItems = (int)$countResult['total'];

            // Calculate pagination info
            $totalPages = ceil($totalItems / $limit);
            $hasMore = $page < $totalPages;

            // Get data
            $dataStmt = $this->pdo->query($dataQuery, $params);
            $data = $dataStmt->fetchAll(PDO::FETCH_ASSOC);

            // Prepare response
            $paginatedResponse = [
                'data' => $data,
                'pagination' => [
                    'currentPage' => $page,
                    'totalPages' => $totalPages,
                    'totalItems' => $totalItems,
                    'itemsPerPage' => $limit,
                    'hasMore' => $hasMore
                ]
            ];

            $response = new Response();
            $response->success($paginatedResponse);
        } catch (Exception $e) {
            error_log("Entities fetch error: " . $e->getMessage());
            $response = new Response();
            $response->error('Data fetch failed', 500, $e->getMessage());
        }
    }
}