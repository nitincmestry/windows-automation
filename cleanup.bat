@echo off
:: Windows 10 Cleanup Batch Launcher
:: This will run cleanup.ps1 with Administrator rights

:: Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo.
    echo ====================================================
    echo   Please run this batch file as Administrator!
    echo   (Right-click -> Run as administrator)
    echo ====================================================
    pause
    exit /b
)

:: Run PowerShell script
PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0cleanup.ps1"

echo.
echo ====================================================
echo   Cleanup completed! Please restart your computer
echo   for best performance.
echo ====================================================
pause
