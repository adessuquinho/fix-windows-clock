# Windows Clock Fix

This repository contains two batch scripts to fix and synchronize the Windows system clock.

## Overview

These scripts help resolve Windows clock synchronization issues by resetting and syncing your system time with NTP (Network Time Protocol) servers.

## Scripts

### 1. sync-clock.bat
Synchronizes your Windows system clock with NTP servers.

**What it does:**
- Verifies administrator privileges
- Stops the Windows Time Service
- Restarts the Windows Time Service
- Forces synchronization with NTP servers
- Reports success or failure

### 2. reset-clock.bat
Performs a complete reset of the Windows Time Service.

**What it does:**
- Verifies administrator privileges
- Stops the Windows Time Service
- Unregisters the time service
- Registers the time service again
- Starts the Windows Time Service
- Configures trusted NTP servers (a.ntp.br and time.google.com)
- Forces synchronization with NTP servers

## Usage Instructions

> **Important:** Both scripts must be run as Administrator.

### Step 1: Run sync-clock.bat first
```
sync-clock.bat
```
This will synchronize your clock with the NTP servers. Wait for completion.

### Step 2: Run reset-clock.bat
```
reset-clock.bat
```
This will perform a complete reset of the Windows Time Service and force synchronization.

## How to Run as Administrator

1. Right-click on the batch file (.bat)
2. Select "Run as administrator"
3. Click "Yes" when prompted by User Account Control
4. Wait for the script to complete
5. Press any key to close the window

## Requirements

- Windows 10 or later
- Administrator access
- Internet connection (for NTP synchronization)

## Troubleshooting

If the scripts fail:
- Ensure you have an active internet connection
- Verify you're running the scripts with administrator privileges
- Check your firewall settings to allow NTP traffic (UDP port 123)
- Check Windows policies that might restrict time synchronization
- Open Date and Time settings to verify the status after running the scripts

## Notes

- The scripts will pause at the end to display any messages or errors
- If synchronization fails, it may indicate network connectivity issues or system policy restrictions
- You can verify the time synchronization status in Windows Settings > Time & language > Date & time