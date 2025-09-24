@echo off
echo ========================================
echo Kendrix Sync Service - Service Manager
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

:MENU
echo.
echo Service Management Options:
echo ========================================
echo 1. Start Service
echo 2. Stop Service
echo 3. Restart Service
echo 4. Check Status
echo 5. View Recent Logs
echo 6. View Live Logs (Event Viewer)
echo 7. Uninstall Service
echo 8. Exit
echo ========================================
set /p choice="Enter your choice (1-8): "

if "%choice%"=="1" goto START_SERVICE
if "%choice%"=="2" goto STOP_SERVICE
if "%choice%"=="3" goto RESTART_SERVICE
if "%choice%"=="4" goto CHECK_STATUS
if "%choice%"=="5" goto VIEW_LOGS
if "%choice%"=="6" goto LIVE_LOGS
if "%choice%"=="7" goto UNINSTALL_SERVICE
if "%choice%"=="8" goto EXIT

echo Invalid choice. Please try again.
goto MENU

:START_SERVICE
echo.
echo Starting Kendrix Sync Service...
sc start "KendrixSyncService"
if %errorLevel% == 0 (
    echo [OK] Service started successfully
) else (
    echo [ERROR] Failed to start service
)
timeout /t 2 /nobreak >nul
goto MENU

:STOP_SERVICE
echo.
echo Stopping Kendrix Sync Service...
sc stop "KendrixSyncService"
if %errorLevel% == 0 (
    echo [OK] Service stopped successfully
) else (
    echo [ERROR] Failed to stop service
)
timeout /t 2 /nobreak >nul
goto MENU

:RESTART_SERVICE
echo.
echo Restarting Kendrix Sync Service...
sc stop "KendrixSyncService"
timeout /t 3 /nobreak >nul
sc start "KendrixSyncService"
if %errorLevel% == 0 (
    echo [OK] Service restarted successfully
) else (
    echo [ERROR] Failed to restart service
)
timeout /t 2 /nobreak >nul
goto MENU

:CHECK_STATUS
echo.
echo Service Status:
echo ========================================
sc query "KendrixSyncService"
echo ========================================
pause
goto MENU

:VIEW_LOGS
echo.
echo Recent Logs (Last 20 entries):
echo ========================================
powershell -Command "Get-EventLog -LogName Application -Source 'Kendrix Sync Service' -Newest 20 | Format-Table TimeGenerated, EntryType, Message -Wrap"
echo ========================================
pause
goto MENU

:LIVE_LOGS
echo.
echo Opening Event Viewer...
eventvwr.msc
goto MENU

:UNINSTALL_SERVICE
echo.
echo WARNING: This will completely remove the service!
set /p confirm="Are you sure? (Y/N): "
if /i "%confirm%"=="Y" (
    echo Stopping service...
    sc stop "KendrixSyncService" >nul 2>&1
    timeout /t 3 /nobreak >nul
    echo Uninstalling service...
    sc delete "KendrixSyncService"
    if %errorLevel% == 0 (
        echo [OK] Service uninstalled successfully
    ) else (
        echo [ERROR] Failed to uninstall service
    )
) else (
    echo Uninstall cancelled.
)
timeout /t 2 /nobreak >nul
goto MENU

:EXIT
echo.
echo Goodbye!
exit /b 0