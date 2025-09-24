# Kendrix Sync System - OAuth 2.0 Migration Guide

## 🎯 Overview

This guide covers the migration from the legacy JWT authentication system to the new OAuth 2.0 implementation. The migration includes enhanced security, centralized configuration management, comprehensive audit logging, and improved transaction handling.

## 🚀 Quick Start

### Prerequisites

- **Server**: PHP 7.4+, MySQL 8.0+, Web server (Apache/Nginx)
- **Client**: Windows Server/Desktop, .NET Framework 4.7.2+, IIS or Windows Service
- **Access**: Database admin credentials, web server access, Windows admin rights

### 1. Server Migration (API)

```bash
# Navigate to API directory
cd /path/to/kendrix-sync-api

# Run the migration script
chmod +x deploy_oauth2_migration.sh
./deploy_oauth2_migration.sh
```

The script will:
- ✅ Check prerequisites (PHP extensions, MySQL connection)
- ✅ Backup current installation
- ✅ Run database migrations (OAuth tables, audit logging)
- ✅ Set up environment configuration
- ✅ Create default OAuth client
- ✅ Configure proper permissions
- ✅ Verify installation

### 2. Client Migration (Windows Service)

```powershell
# Run PowerShell as Administrator
# Navigate to sync service directory
cd "C:\Path\To\kendrix-sync-service"

# Run the migration script
.\Deploy-OAuth2Migration.ps1 -ClientId "your-client-id" -ClientSecret "your-client-secret" -ApiBaseUrl "https://your-api.com"
```

The script will:
- ✅ Stop the sync service
- ✅ Backup current configuration
- ✅ Update App.config with OAuth settings
- ✅ Remove legacy JWT settings
- ✅ Validate new configuration
- ✅ Restart the service

## 📋 Detailed Migration Steps

### Server-Side Migration

#### Step 1: Database Migration

Run the provided SQL migration script:

```sql
-- Creates OAuth 2.0 tables
source migrations/oauth2_migration.sql
```

**New Tables Created:**
- `oauth_clients` - OAuth client credentials and metadata
- `oauth_tokens` - Access and refresh tokens with expiration
- `audit_logs` - Comprehensive audit trail
- `sync_config` - Centralized configuration management
- `rate_limits` - API rate limiting and security

#### Step 2: Environment Configuration

Create a `.env` file in your API directory:

```env
# Database Configuration
DB_HOST=localhost
DB_NAME=kendrix_sync
DB_USER=your_db_user

# OAuth 2.0 Security Keys (generate with openssl rand -hex 32)
OAUTH2_SECRET_KEY=your_oauth2_secret_key_here
CONFIG_ENCRYPTION_KEY=your_config_encryption_key_here

# API Configuration
API_DEBUG=false
API_LOG_LEVEL=info

# Security Configuration
RATE_LIMIT_ENABLED=true
RATE_LIMIT_REQUESTS=1000
RATE_LIMIT_WINDOW=3600
```

#### Step 3: Register OAuth Client

```php
<?php
// Create OAuth client for your sync service
require_once 'classes/OAuth2Service.php';

$oauth2 = new OAuth2Service();
$client = $oauth2->registerClient(
    'Kendrix Sync Service',  // Client name
    1,                       // Tenant ID
    ['sync', 'admin']        // Scopes
);

echo "Client ID: " . $client['client_id'] . "\n";
echo "Client Secret: " . $client['client_secret'] . "\n";
```

### Client-Side Migration

#### Step 1: Update App.config

Replace JWT settings with OAuth 2.0:

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <appSettings>
    <!-- OAuth 2.0 Configuration -->
    <add key="OAuth.ClientId" value="your-client-id-here" />
    <add key="OAuth.ClientSecret" value="your-client-secret-here" />
    <add key="OAuth.TokenEndpoint" value="https://your-api.com/auth/token" />
    <add key="OAuth.LogoutEndpoint" value="https://your-api.com/auth/logout" />
    <add key="OAuth.Scope" value="sync" />
    
    <!-- API Configuration -->
    <add key="KendrixApi.BaseUrl" value="https://your-api.com/" />
    <add key="KendrixApi.TenantKey" value="your-tenant-key" />
    <add key="KendrixApi.BatchSize" value="100" />
    
    <!-- Remove these old JWT settings -->
    <!-- <add key="KendrixApi.JwtSecret" value="..." /> -->
    <!-- <add key="JWT.SecretKey" value="..." /> -->
  </appSettings>
</configuration>
```

#### Step 2: Deploy New Service Files

Ensure these new files are deployed:

- `Services/OAuth2Service.cs` - OAuth 2.0 client implementation
- `Services/ApiService.cs` - Updated API service
- `Services/SyncService.cs` - Updated sync service

## 🔧 Configuration Management

### Centralized Configuration

The new system supports centralized configuration management:

```php
// Server-side configuration management
$config = new ConfigService();

// Set configuration for tenant
$config->set(1, 'sync_interval', 300);
$config->set(1, 'batch_size', 100);
$config->set(1, 'api_timeout', 60);

// Get client configuration
$clientConfig = $config->generateClientConfig(1, 'xml'); // or 'json', 'ini'
```

### Automatic Configuration Updates

Clients can fetch configuration updates automatically:

```csharp
// Client-side configuration checking
var configService = new ConfigurationService();
if (await configService.HasUpdatesAsync())
{
    await configService.FetchUpdatesAsync();
    // Restart service or apply changes
}
```

## 📊 Audit Logging & Monitoring

### Available Logs

The new system provides comprehensive logging:

```php
// Authentication events
$auditLogger->logAuth('token_generated', $clientId, $tenantId, true);

// Sync operations
$auditLogger->logSync($tenantId, 'Fatura', 'apply', 150, 0);

// Configuration changes
$auditLogger->logConfigChange($tenantId, 'batch_size', 50, 100);
```

### Monitoring Endpoints

New monitoring endpoints are available:

- `GET /health` - System health check
- `GET /auth/stats` - Authentication statistics  
- `GET /sync/stats` - Sync operation metrics
- `GET /audit/logs?tenant_id=1&limit=100` - Audit log access

### Example Monitoring Queries

```sql
-- Recent authentication failures
SELECT * FROM audit_logs 
WHERE action = 'token_failed' 
AND created_at > DATE_SUB(NOW(), INTERVAL 1 HOUR);

-- Sync operation performance
SELECT resource, AVG(JSON_EXTRACT(new_values, '$.duration_ms')) as avg_duration
FROM audit_logs 
WHERE action = 'sync' 
GROUP BY resource;

-- Error rate by table
SELECT resource, 
       COUNT(*) as total_ops,
       SUM(CASE WHEN status = 'error' THEN 1 ELSE 0 END) as errors,
       (SUM(CASE WHEN status = 'error' THEN 1 ELSE 0 END) / COUNT(*)) * 100 as error_rate
FROM audit_logs 
WHERE action = 'sync' 
AND created_at > DATE_SUB(NOW(), INTERVAL 24 HOUR)
GROUP BY resource;
```

## 🔒 Security Improvements

### OAuth 2.0 Security Features

- **Token Expiration**: Access tokens expire after 1 hour
- **Refresh Tokens**: Automatic token refresh without re-authentication
- **Token Revocation**: Secure logout invalidates all tokens
- **Scope-based Access**: Fine-grained permission control
- **Rate Limiting**: Prevents abuse and brute force attacks

### Data Protection

- **Configuration Encryption**: Sensitive config values encrypted at rest
- **Audit Trail Integrity**: Tamper-evident logging
- **Transaction Safety**: Atomic operations with rollback
- **Input Validation**: Enhanced parameter validation
- **SQL Injection Protection**: Prepared statements throughout

## 🛠️ Troubleshooting

### Common Issues

#### Authentication Errors

```
Error: "Invalid client credentials"
```
**Solution**: Verify OAuth client ID and secret in App.config

```
Error: "Token expired"
```
**Solution**: Check system clock synchronization, tokens auto-refresh

#### Sync Failures

```
Error: "Idempotency key violation"
```
**Solution**: Check for duplicate requests, review idempotency service logs

```
Error: "Transaction rollback"
```
**Solution**: Review audit logs for specific error details

#### Configuration Issues

```
Error: "Configuration not found"
```
**Solution**: Initialize default configuration for tenant

```
Error: "Decryption failed"
```
**Solution**: Verify CONFIG_ENCRYPTION_KEY environment variable

### Diagnostic Commands

#### Server Diagnostics

```bash
# Check OAuth token generation
curl -X POST "https://your-api.com/auth/token" \
  -H "Content-Type: application/json" \
  -d '{"grant_type":"client_credentials","client_id":"your-id","client_secret":"your-secret"}'

# Check health endpoint
curl "https://your-api.com/health"

# View recent audit logs
mysql -e "SELECT * FROM audit_logs ORDER BY created_at DESC LIMIT 10;" kendrix_sync
```

#### Client Diagnostics

```powershell
# Check service status
Get-Service "Kendrix Sync Service"

# View service logs
Get-WinEvent -LogName Application | Where-Object {$_.ProviderName -eq "Kendrix Sync Service"}

# Test configuration
Test-NetConnection your-api.com -Port 443
```

### Log Locations

- **Server Logs**: `/var/log/apache2/error.log` or `/var/log/nginx/error.log`
- **Database Logs**: `audit_logs` table
- **Client Logs**: Windows Event Log → Application → Kendrix Sync Service
- **Client Config**: `%ProgramFiles%\Kendrix Sync Service\kendrix-sync-service.exe.config`

## 📈 Performance Optimization

### Recommended Settings

#### Server Configuration

```php
// Optimal configuration for production
$config->set($tenantId, 'batch_size', 100);           // Balance memory vs. throughput
$config->set($tenantId, 'sync_interval', 300);        // 5-minute intervals
$config->set($tenantId, 'timeout_seconds', 60);       // Request timeout
$config->set($tenantId, 'max_retries', 3);           // Retry failed operations
$config->set($tenantId, 'cleanup_days', 90);         // Audit log retention
```

#### Database Optimization

```sql
-- Add indexes for performance (already included in migration)
ALTER TABLE audit_logs ADD INDEX idx_tenant_created (tenant_id, created_at);
ALTER TABLE oauth_tokens ADD INDEX idx_expires (access_expires_at);
ALTER TABLE sync_versions ADD INDEX idx_tenant_table (TenantId, TableName);

-- Regular maintenance
ANALYZE TABLE audit_logs, oauth_tokens, idempotency_keys;
OPTIMIZE TABLE audit_logs, oauth_tokens, idempotency_keys;
```

### Monitoring Performance

```sql
-- Monitor sync performance
SELECT 
    DATE(created_at) as date,
    resource as table_name,
    COUNT(*) as sync_operations,
    AVG(JSON_EXTRACT(new_values, '$.duration_ms')) as avg_duration_ms,
    MAX(JSON_EXTRACT(new_values, '$.duration_ms')) as max_duration_ms
FROM audit_logs 
WHERE action = 'sync' 
AND created_at > DATE_SUB(NOW(), INTERVAL 7 DAY)
GROUP BY DATE(created_at), resource
ORDER BY date DESC, avg_duration_ms DESC;
```

## 🔄 Rollback Procedure

If you need to rollback the migration:

### Server Rollback

```bash
# 1. Restore database backup
mysql kendrix_sync < backup_before_migration.sql

# 2. Restore API files
rm -rf /var/www/html/kendrix-sync-api
mv /var/www/html/kendrix-sync-api_backup_YYYYMMDD /var/www/html/kendrix-sync-api

# 3. Restart web server
systemctl restart apache2  # or nginx
```

### Client Rollback

```powershell
# 1. Stop service
Stop-Service "Kendrix Sync Service"

# 2. Restore configuration
Copy-Item "kendrix-sync-service.exe.config.backup.*" "kendrix-sync-service.exe.config"

# 3. Restore old service files (if needed)
# Deploy previous version files

# 4. Start service
Start-Service "Kendrix Sync Service"
```

## 📞 Support

### Getting Help

1. **Documentation**: Review this guide and the API documentation
2. **Logs**: Check audit logs and system logs for detailed error information
3. **Monitoring**: Use the built-in monitoring endpoints
4. **Testing**: Use the health endpoint to verify system status

### Reporting Issues

When reporting issues, include:

- Error messages from audit logs
- Client and server configuration (remove secrets)
- Steps to reproduce the issue
- System information (OS, PHP version, .NET version)
- Relevant log excerpts

## 📝 Changelog

### Version 2.0.0 (OAuth 2.0 Migration)

#### Added
- ✅ OAuth 2.0 Client Credentials Flow
- ✅ Centralized configuration management
- ✅ Comprehensive audit logging
- ✅ Enhanced idempotency with response caching
- ✅ Atomic transaction support
- ✅ Rate limiting and security improvements
- ✅ Automated deployment scripts
- ✅ Performance monitoring endpoints

#### Changed
- 🔄 Authentication system (JWT → OAuth 2.0)
- 🔄 Configuration management (file-based → database)
- 🔄 Error handling and logging
- 🔄 Database schema (new tables added)

#### Removed
- ❌ Custom JWT implementation
- ❌ Manual token generation scripts
- ❌ File-based configuration updates

#### Migration Path
- ✅ Backward-compatible database migration
- ✅ Automated deployment scripts
- ✅ Configuration conversion tools
- ✅ Rollback procedures documented

---

**Migration completed successfully! 🎉**

Your Kendrix Sync system is now running with enterprise-grade security, monitoring, and maintainability features.