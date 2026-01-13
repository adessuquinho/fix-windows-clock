@echo off
title Windows Time Service Complete Reset

:: Administrator verification
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Run this script as ADMINISTRATOR.
    pause
    exit /b
)

echo Stopping time service...
net stop w32time

echo Unregistering service...
w32tm /unregister

timeout /t 2 >nul

echo Registering service again...
w32tm /register

timeout /t 2 >nul

echo Starting time service...
net start w32time

echo Configuring trusted NTP servers...
REM Using global NTP servers: pool.ntp.org (primary), time.google.com (secondary), time.cloudflare.com (tertiary)
REM To use different servers, modify the list below and replace with your preferred servers
w32tm /config /manualpeerlist:"pool.ntp.org,0x9 time.google.com,0x9 time.cloudflare.com,0x9" /syncfromflags:manual /reliable:no /update

echo Forcing synchronization...
w32tm /resync /force

echo.
echo Complete reset finished.
echo Open Date and Time settings and verify the status.
pause
