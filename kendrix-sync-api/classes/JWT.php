<?php
/**
 * Simple JWT implementation for PHP 7.4
 */

class JWT
{
    private $secret;

    public function __construct()
    {
        $this->secret = 'your-jwt-secret-key-here'; // Change this in production
    }

    public function encode($payload)
    {
        $header = json_encode(['typ' => 'JWT', 'alg' => 'HS256']);
        $payload = json_encode($payload);

        $base64Header = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($header));
        $base64Payload = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($payload));

        $signature = hash_hmac('sha256', $base64Header . "." . $base64Payload, $this->secret, true);
        $base64Signature = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($signature));

        return $base64Header . "." . $base64Payload . "." . $base64Signature;
    }

    public function decode($jwt)
    {
        $parts = explode('.', $jwt);
        if (count($parts) !== 3) {
            return false;
        }

        list($base64Header, $base64Payload, $base64Signature) = $parts;

        $header = json_decode(base64_decode(str_replace(['-', '_'], ['+', '/'], $base64Header)), true);
        $payload = json_decode(base64_decode(str_replace(['-', '_'], ['+', '/'], $base64Payload)), true);

        if (!$header || !$payload) {
            return false;
        }

        $signature = base64_decode(str_replace(['-', '_'], ['+', '/'], $base64Signature));
        $expectedSignature = hash_hmac('sha256', $base64Header . "." . $base64Payload, $this->secret, true);

        if (!hash_equals($signature, $expectedSignature)) {
            return false;
        }

        return $payload;
    }

    public function validate($jwt)
    {
        $payload = $this->decode($jwt);
        
        if (!$payload) {
            return false;
        }

        // Check expiration
        if (isset($payload['exp']) && $payload['exp'] < time()) {
            return false;
        }

        // Check subject
        if (!isset($payload['sub']) || $payload['sub'] !== 'agent') {
            return false;
        }

        // Check scope if present
        if (isset($payload['scope']) && strpos($payload['scope'], 'sync') === false) {
            return false;
        }

        return true;
    }
}

