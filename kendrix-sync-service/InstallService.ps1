# PowerShell script to install Kendrix Sync Service
param(
    [string]$ServiceName = "KendrixSyncService",
    [string]$DisplayName = "Kendrix Sync Service",
    [string]$Description = "Windows Service for syncing data with Kendrix API",
    [string]$BinaryPath = "",
    [string]$StartType = "Automatic"
)

# Check if running as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Error "This script requires Administrator privileges. Please run as Administrator."
    exit 1
}

# Get the directory where the script is located
$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$BinaryPath = if ($BinaryPath -eq "") { Join-Path $ScriptPath "KendrixSyncService.exe" } else { $BinaryPath }

# Check if the executable exists
if (-not (Test-Path $BinaryPath)) {
    Write-Error "Executable not found at: $BinaryPath"
    Write-Error "Please build the project first or specify the correct path."
    exit 1
}

Write-Host "Installing Windows Service..." -ForegroundColor Green
Write-Host "Service Name: $ServiceName" -ForegroundColor Yellow
Write-Host "Display Name: $DisplayName" -ForegroundColor Yellow
Write-Host "Binary Path: $BinaryPath" -ForegroundColor Yellow

try {
    # Check if service already exists
    $existingService = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
    
    if ($existingService) {
        Write-Host "Service already exists. Stopping and removing..." -ForegroundColor Yellow
        Stop-Service -Name $ServiceName -Force -ErrorAction SilentlyContinue
        sc.exe delete $ServiceName
        Start-Sleep -Seconds 2
    }

    # Create the service
    New-Service -Name $ServiceName -BinaryPathName $BinaryPath -DisplayName $DisplayName -Description $Description -StartupType $StartType

    Write-Host "Service installed successfully!" -ForegroundColor Green
    Write-Host "You can now start the service using: Start-Service -Name $ServiceName" -ForegroundColor Cyan
    Write-Host "Or use Services.msc to manage the service." -ForegroundColor Cyan

} catch {
    Write-Error "Failed to install service: $($_.Exception.Message)"
    exit 1
}

