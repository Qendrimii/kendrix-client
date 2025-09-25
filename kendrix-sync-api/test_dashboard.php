<?php
// Test the dashboard API endpoint
$url = 'https://client.kendrix.org/api/mobile/v1/dashboard/stats';

// First, get a login token
$loginUrl = 'https://client.kendrix.org/api/mobile/v1/auth/login';
$loginData = [
    'email' => 'user@kendrix.org',
    'password' => 'password123',
    'tenant_key' => 'KENDRIX-CLIENT-001'
];

$loginOptions = [
    'http' => [
        'header' => "Content-type: application/json\r\n",
        'method' => 'POST',
        'content' => json_encode($loginData)
    ]
];

$loginContext = stream_context_create($loginOptions);
$loginResult = file_get_contents($loginUrl, false, $loginContext);

echo "Login Response: " . $loginResult . "\n\n";

// Parse the login response to get the token
$loginResponse = json_decode($loginResult, true);
if (isset($loginResponse['data']['access_token'])) {
    $token = $loginResponse['data']['access_token'];
    echo "Token: " . substr($token, 0, 50) . "...\n\n";
    
    // Now test the dashboard API
    $dashboardOptions = [
        'http' => [
            'header' => "Authorization: Bearer $token\r\n" .
                       "X-Tenant-External-Key: KENDRIX-CLIENT-001\r\n" .
                       "Content-type: application/json\r\n",
            'method' => 'GET'
        ]
    ];
    
    $dashboardContext = stream_context_create($dashboardOptions);
    $dashboardResult = file_get_contents($url, false, $dashboardContext);
    
    echo "Dashboard Response: " . $dashboardResult . "\n";
    echo "HTTP Response Headers: " . print_r($http_response_header, true) . "\n";
} else {
    echo "Failed to get token from login response\n";
}
?>
