# Install stored procedures for Kendrix Sync API
# Run this PowerShell script on Windows

Write-Host "Installing Kendrix Sync API stored procedures..." -ForegroundColor Green

# Database connection details
$DB_HOST = "127.0.0.1"
$DB_PORT = "3306"
$DB_NAME = "u220447391_client_rest"
$DB_USER = "u220447391_client_rest"
$DB_PASS = "kendriX2025"

# Install procedures
Write-Host "Installing sp_get_user_sales_simple..." -ForegroundColor Yellow
Get-Content "stored_procedures\sp_get_user_sales_simple.sql" | mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME

Write-Host "Installing sp_get_todays_sales_by_category..." -ForegroundColor Yellow
Get-Content "stored_procedures\sp_get_todays_sales_by_category.sql" | mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME

Write-Host "Installing sp_get_todays_deletions_by_user..." -ForegroundColor Yellow
Get-Content "stored_procedures\sp_get_todays_deletions_by_user.sql" | mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME

Write-Host "Installing sp_get_running_sales_total..." -ForegroundColor Yellow
Get-Content "stored_procedures\sp_get_running_sales_total.sql" | mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME

Write-Host "Installing sp_get_fatura_list..." -ForegroundColor Yellow
Get-Content "stored_procedures\sp_get_fatura_list.sql" | mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME

Write-Host "Installing sp_get_blerjet_list..." -ForegroundColor Yellow
Get-Content "stored_procedures\sp_get_blerjet_list.sql" | mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME

Write-Host "All stored procedures installed successfully!" -ForegroundColor Green