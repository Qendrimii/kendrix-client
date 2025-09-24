# PowerShell script to generate JWT tokens for Kendrix Sync API
# Requires: Install-Module -Name JWT

param(
    [Parameter(Mandatory=$true)]
    [string]$Secret,
    
    [Parameter(Mandatory=$false)]
    [int]$ExpirationHours = 24,
    
    [Parameter(Mandatory=$false)]
    [string]$Subject = "agent",
    
    [Parameter(Mandatory=$false)]
    [string]$Scope = "sync"
)

# Install JWT module if not already installed
if (-not (Get-Module -ListAvailable -Name JWT)) {
    Write-Host "Installing JWT module..." -ForegroundColor Yellow
    Install-Module -Name JWT -Force -Scope CurrentUser
}

Import-Module JWT

# Create JWT payload
$payload = @{
    sub = $Subject
    scope = $Scope
    iat = [int][double]::Parse((Get-Date -UFormat %s))
    exp = [int][double]::Parse((Get-Date).AddHours($ExpirationHours).ToString("yyyy-MM-ddTHH:mm:ss.fffZ"))
}

# Convert to JSON
$payloadJson = $payload | ConvertTo-Json -Compress

Write-Host "Payload: $payloadJson" -ForegroundColor Green

# Generate JWT token
$token = New-JWT -Algorithm HS256 -Secret $Secret -Payload $payload

Write-Host "Generated JWT Token:" -ForegroundColor Cyan
Write-Host $token -ForegroundColor White

# Test the token (optional)
Write-Host "`nTesting token..." -ForegroundColor Yellow
try {
    $decoded = Get-JWT -Token $token -Secret $Secret
    Write-Host "Token is valid!" -ForegroundColor Green
    Write-Host "Decoded payload: $($decoded | ConvertTo-Json)" -ForegroundColor Gray
} catch {
    Write-Host "Token validation failed: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nUsage example:" -ForegroundColor Yellow
Write-Host "curl -H `"Authorization: Bearer $token`" -H `"X-Tenant-External-Key: YOUR_TENANT_KEY`" https://your-api-domain.com/api/sync/v1/heartbeat" -ForegroundColor Gray

