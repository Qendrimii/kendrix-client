<?php
/**
 * Response helper class
 */

class Response
{
    public function success($data = null, $statusCode = 200)
    {
        http_response_code($statusCode);
        
        $response = [
            'success' => true,
            'timestamp' => date('c')
        ];
        
        if ($data !== null) {
            $response['data'] = $data;
        }
        
        echo json_encode($response, JSON_PRETTY_PRINT);
        exit;
    }

    public function error($message, $statusCode = 400, $details = null)
    {
        http_response_code($statusCode);
        
        $response = [
            'success' => false,
            'error' => $message,
            'timestamp' => date('c')
        ];
        
        if ($details !== null) {
            $response['details'] = $details;
        }
        
        echo json_encode($response, JSON_PRETTY_PRINT);
        exit;
    }
}

