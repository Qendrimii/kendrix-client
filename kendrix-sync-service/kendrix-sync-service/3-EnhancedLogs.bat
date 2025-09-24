@echo off
echo ========================================
echo Kendrix Sync Service - Enhanced Logs
echo ========================================
echo.

:MENU
echo Log Viewing Options:
echo ========================================
echo 1. View Recent Logs (Last 10)
echo 2. View Recent Logs (Last 25)
echo 3. View Recent Logs (Last 50)
echo 4. View Error Logs Only
echo 5. View Info/Warning Logs
echo 6. View All Logs (Last 100)
echo 7. View Logs from Last Hour
echo 8. View Logs from Today
echo 9. Export Logs to File
echo 10. Monitor Live Logs
echo 11. Exit
echo ========================================
set /p choice="Enter your choice (1-11): "

if "%choice%"=="1" goto RECENT_10
if "%choice%"=="2" goto RECENT_25
if "%choice%"=="3" goto RECENT_50
if "%choice%"=="4" goto ERROR_LOGS
if "%choice%"=="5" goto INFO_LOGS
if "%choice%"=="6" goto ALL_LOGS
if "%choice%"=="7" goto LAST_HOUR
if "%choice%"=="8" goto TODAY_LOGS
if "%choice%"=="9" goto EXPORT_LOGS
if "%choice%"=="10" goto LIVE_MONITOR
if "%choice%"=="11" goto EXIT

echo Invalid choice. Please try again.
goto MENU

:RECENT_10
echo.
echo Recent Logs (Last 10):
echo ========================================
powershell -Command "Get-EventLog -LogName Application -Source 'Kendrix Sync Service' -Newest 10 | Format-Table TimeGenerated, EntryType, Message -Wrap"
echo ========================================
pause
goto MENU

:RECENT_25
echo.
echo Recent Logs (Last 25):
echo ========================================
powershell -Command "Get-EventLog -LogName Application -Source 'Kendrix Sync Service' -Newest 25 | Format-Table TimeGenerated, EntryType, Message -Wrap"
echo ========================================
pause
goto MENU

:RECENT_50
echo.
echo Recent Logs (Last 50):
echo ========================================
powershell -Command "Get-EventLog -LogName Application -Source 'Kendrix Sync Service' -Newest 50 | Format-Table TimeGenerated, EntryType, Message -Wrap"
echo ========================================
pause
goto MENU

:ERROR_LOGS
echo.
echo Error Logs:
echo ========================================
powershell -Command "Get-EventLog -LogName Application -Source 'Kendrix Sync Service' -EntryType Error -Newest 20 | Format-Table TimeGenerated, EntryType, Message -Wrap"
echo ========================================
pause
goto MENU

:INFO_LOGS
echo.
echo Information and Warning Logs:
echo ========================================
powershell -Command "Get-EventLog -LogName Application -Source 'Kendrix Sync Service' | Where-Object {$_.EntryType -eq 'Information' -or $_.EntryType -eq 'Warning'} | Select-Object -First 20 | Format-Table TimeGenerated, EntryType, Message -Wrap"
echo ========================================
pause
goto MENU

:ALL_LOGS
echo.
echo All Logs (Last 100):
echo ========================================
powershell -Command "Get-EventLog -LogName Application -Source 'Kendrix Sync Service' -Newest 100 | Format-Table TimeGenerated, EntryType, Message -Wrap"
echo ========================================
pause
goto MENU

:LAST_HOUR
echo.
echo Logs from Last Hour:
echo ========================================
powershell -Command "Get-EventLog -LogName Application -Source 'Kendrix Sync Service' -After (Get-Date).AddHours(-1) | Format-Table TimeGenerated, EntryType, Message -Wrap"
echo ========================================
pause
goto MENU

:TODAY_LOGS
echo.
echo Today's Logs:
echo ========================================
powershell -Command "Get-EventLog -LogName Application -Source 'Kendrix Sync Service' -After (Get-Date -Hour 0 -Minute 0 -Second 0) | Format-Table TimeGenerated, EntryType, Message -Wrap"
echo ========================================
pause
goto MENU

:EXPORT_LOGS
echo.
echo Exporting logs to file...
set "EXPORT_FILE=%~dp0KendrixSyncLogs_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
set "EXPORT_FILE=%EXPORT_FILE: =0%"
powershell -Command "Get-EventLog -LogName Application -Source 'Kendrix Sync Service' -Newest 500 | Format-Table TimeGenerated, EntryType, Message -Wrap | Out-File -FilePath '%EXPORT_FILE%' -Encoding UTF8"
echo [OK] Logs exported to: %EXPORT_FILE%
echo ========================================
pause
goto MENU

:LIVE_MONITOR
echo.
echo Live Log Monitor (Press Ctrl+C to stop):
echo ========================================
echo Monitoring for new log entries...
echo.
powershell -Command "while($true) { Get-EventLog -LogName Application -Source 'Kendrix Sync Service' -Newest 1 | Format-Table TimeGenerated, EntryType, Message -Wrap; Start-Sleep -Seconds 5; }"
goto MENU

:EXIT
echo.
echo Goodbye!
exit /b 0