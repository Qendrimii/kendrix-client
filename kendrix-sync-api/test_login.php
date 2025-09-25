<?php
// Test the login API endpoint
$url = 'https://client.kendrix.org/api/mobile/v1/auth/login';
$data = [
    'email' => 'user@kendrix.org',
    'password' => 'password123',
    'tenant_key' => 'KENDRIX-CLIENT-001'
];

$options = [
    'http' => [
        'header' => "Content-type: application/json\r\n",
        'method' => 'POST',
        'content' => json_encode($data)
    ]
];

$context = stream_context_create($options);
$result = file_get_contents($url, false, $context);

echo "Response: " . $result . "\n";
echo "HTTP Response Headers: " . print_r($http_response_header, true) . "\n";
?>
