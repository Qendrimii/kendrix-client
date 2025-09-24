@echo off
echo ========================================
echo Kendrix Sync Service - Install Service
echo ========================================
echo.

:: Check if running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Running as Administrator
) else (
    echo [ERROR] This script must be run as Administrator
    echo Right-click and select "Run as administrator"
    pause
    exit /b 1
)

echo.
echo 1. Checking for compiled binaries...
echo ========================================

:: Get current directory and remove trailing slash
set "CURRENT_DIR=%~dp0"
if "%CURRENT_DIR:~-1%"=="\" set "CURRENT_DIR=%CURRENT_DIR:~0,-1%"
echo [DEBUG] Current directory: %CURRENT_DIR%

:: Check if Release binary exists
set "RELEASE_EXE=%CURRENT_DIR%\bin\Release\kendrix-sync-service.exe"
set "DEBUG_EXE=%CURRENT_DIR%\bin\Debug\kendrix-sync-service.exe"

echo [DEBUG] Checking Release path: %RELEASE_EXE%
echo [DEBUG] Checking Debug path: %DEBUG_EXE%

if exist "%RELEASE_EXE%" (
    echo [OK] Release binary found
    set "BINARY_PATH=%RELEASE_EXE%"
    set "CONFIG_PATH=%CURRENT_DIR%\bin\Release\kendrix-sync-service.exe.config"
    goto :binary_found
) 

if exist "%DEBUG_EXE%" (
    echo [WARNING] Using Debug binary (Release not found)
    set "BINARY_PATH=%DEBUG_EXE%"
    set "CONFIG_PATH=%CURRENT_DIR%\bin\Debug\kendrix-sync-service.exe.config"
    goto :binary_found
)

echo [ERROR] No compiled binary found!
echo.
echo [DEBUG] Checked locations:
echo - %RELEASE_EXE%
echo - %DEBUG_EXE%
echo.
echo Please build the project first using Visual Studio or run Build.bat
pause
exit /b 1

:binary_found
echo [INFO] Using binary: %BINARY_PATH%

echo.
echo 2. Stopping existing service (if running)...
echo ========================================

sc query "KendrixSyncService" >nul 2>&1
if %errorLevel% == 0 (
    echo [INFO] Service exists, stopping it...
    sc stop "KendrixSyncService"
    timeout /t 3 /nobreak >nul
    echo [OK] Service stopped
) else (
    echo [INFO] Service not installed yet
)

echo.
echo 3. Installing/Updating the service...
echo ========================================

:: Check if service exists
sc query "KendrixSyncService" >nul 2>&1
if %errorLevel% == 0 (
    echo [INFO] Updating existing service...
    sc delete "KendrixSyncService"
    timeout /t 2 /nobreak >nul
)

:: Install the service
echo [INFO] Installing service...
sc create "KendrixSyncService" binPath= "%BINARY_PATH%" DisplayName= "Kendrix Sync Service" start= auto

if %errorLevel% neq 0 (
    echo [ERROR] Failed to install service
    pause
    exit /b 1
)

echo [OK] Service installed successfully

:: Set service description
sc description "KendrixSyncService" "Synchronizes data from SQL Server to MySQL via Kendrix API"

echo.
echo 4. Starting the service...
echo ========================================

sc start "KendrixSyncService"

if %errorLevel% neq 0 (
    echo [ERROR] Failed to start service
    echo Check the Windows Event Log for details
    pause
    exit /b 1
)

echo [OK] Service started successfully
echo.

echo 5. Checking service status...
echo ========================================
sc query "KendrixSyncService"

echo.
echo ========================================
echo Installation Complete!
echo ========================================
echo.
echo The service has been installed and started.
echo.
echo To view logs, use:
echo - EnhancedLogs.bat (detailed log viewer)
echo - Event Viewer: Windows Logs > Application (source: Kendrix Sync Service)
echo.
echo To manage the service:
echo - ServiceManager.bat (start/stop/restart)
echo - CompleteDebug.bat (troubleshooting)
echo.
pause