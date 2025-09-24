<?php
/**
 * Database Configuration
 */

class Database
{
    private static $instance = null;
    private $pdo;

    private function __construct()
    {
        $host = '127.0.0.1';
        $port = '3306';
        $dbname = 'u220447391_client_rest';
        $username = 'u220447391_client_rest';
        $password = 'kendriX2025';

        $dsn = "mysql:host={$host};port={$port};dbname={$dbname};charset=utf8mb4";

        try {
            $this->pdo = new PDO($dsn, $username, $password, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ]);
        } catch (PDOException $e) {
            throw new Exception("Database connection failed: " . $e->getMessage());
        }
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function query($sql, $params = [])
    {
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt;
    }

    public function beginTransaction()
    {
        return $this->pdo->beginTransaction();
    }

    public function commit()
    {
        return $this->pdo->commit();
    }

    public function rollback()
    {
        return $this->pdo->rollback();
    }

    public function lastInsertId()
    {
        return $this->pdo->lastInsertId();
    }

    public function inTransaction()
    {
        return $this->pdo->inTransaction();
    }
}

