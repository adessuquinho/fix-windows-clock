@echo off
title Windows Clock Synchronization

:: Verify if running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script needs to run as ADMINISTRATOR.
    echo Right-click and select "Run as administrator".
    pause
    exit /b
)

echo Stopping Windows Time Service...
net stop w32time >nul 2>&1

echo Starting Windows Time Service...
net start w32time >nul 2>&1

echo Forcing synchronization with NTP server...
w32tm /resync /force

if %errorlevel% equ 0 (
    echo.
    echo Synchronization completed successfully.
) else (
    echo.
    echo Synchronization failed. Check internet connection or system policies.
)

pause
