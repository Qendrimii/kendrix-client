<?php
/**
 * JWT Token Generator for Testing
 * Run this to generate a test JWT token
 */

require_once 'classes/JWT.php';

// Configuration
$payload = [
    'sub' => 'agent',
    'scope' => 'sync',
    'iat' => time(),
    'exp' => time() + 3600 // 1 hour
];

$jwt = new JWT();
$token = $jwt->encode($payload);

echo "Generated JWT Token:\n";
echo $token . "\n\n";

echo "Test with cURL:\n";
echo "curl -X GET \"https://client.kendrix.org/api/sync/v1/heartbeat\" \\\n";
echo "  -H \"Authorization: Bearer {$token}\" \\\n";
echo "  -H \"X-Tenant-External-Key: KENDRIX-CLIENT-001\"\n\n";

echo "Token expires at: " . date('Y-m-d H:i:s', $payload['exp']) . "\n";

