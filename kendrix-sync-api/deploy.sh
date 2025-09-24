#!/bin/bash

# Kendrix Sync API - PHP 7.4 Compatible Deployment Script

echo "Starting Kendrix Sync API deployment..."

# Check if PHP is installed
if ! command -v php &> /dev/null; then
    echo "Error: PHP is not installed or not in PATH"
    exit 1
fi

# Check PHP version
PHP_VERSION=$(php -r "echo PHP_VERSION;")
echo "PHP Version: $PHP_VERSION"

if ! php -r "exit(version_compare(PHP_VERSION, '7.4.0', '>=') ? 0 : 1);"; then
    echo "Error: PHP 7.4 or higher is required"
    exit 1
fi

# Check if MySQL client is available
if ! command -v mysql &> /dev/null; then
    echo "Warning: MySQL client not found. You'll need to run setup_database.sql manually."
fi

# Set proper permissions
echo "Setting permissions..."
chmod -R 755 .
chmod 644 *.php
chmod 644 classes/*.php
chmod 644 config/*.php

# Create logs directory if it doesn't exist
mkdir -p logs
chmod 755 logs

echo "Deployment completed successfully!"
echo ""
echo "Next steps:"
echo "1. Run the database setup script:"
echo "   mysql -u u220447391_client_rest -p u220447391_client_rest < setup_database.sql"
echo ""
echo "2. Update configuration files:"
echo "   - Edit config/database.php with your database credentials"
echo "   - Edit classes/JWT.php with your JWT secret"
echo ""
echo "3. Test the API:"
echo "   php test_api.php"
echo ""
echo "4. Configure your web server to point to this directory"
echo "5. Set up SSL certificate for HTTPS"
echo ""
echo "API will be available at: https://your-domain.com/api/sync/v1/"


