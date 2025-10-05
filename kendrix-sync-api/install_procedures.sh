#!/bin/bash

# Install stored procedures for Kendrix Sync API
# Run this script on the database server

echo "Installing Kendrix Sync API stored procedures..."

# Database connection details
DB_HOST="127.0.0.1"
DB_PORT="3306"
DB_NAME="u220447391_client_rest"
DB_USER="u220447391_client_rest"
DB_PASS="kendriX2025"

# Install procedures
echo "Installing sp_get_user_sales_simple..."
mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME < stored_procedures/sp_get_user_sales_simple.sql

echo "Installing sp_get_todays_sales_by_category..."
mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME < stored_procedures/sp_get_todays_sales_by_category.sql

echo "Installing sp_get_todays_deletions_by_user..."
mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME < stored_procedures/sp_get_todays_deletions_by_user.sql

echo "Installing sp_get_running_sales_total..."
mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME < stored_procedures/sp_get_running_sales_total.sql

echo "Installing sp_get_fatura_list..."
mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME < stored_procedures/sp_get_fatura_list.sql

echo "Installing sp_get_blerjet_list..."
mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME < stored_procedures/sp_get_blerjet_list.sql

echo "All stored procedures installed successfully!"