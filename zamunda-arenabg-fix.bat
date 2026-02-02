@echo off
chcp 65001 >nul
title Zamunda.NET & ArenaBG.com Fix Tool
color 0A

:: Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ============================================
    echo  ADMINISTRATOR RIGHTS REQUIRED
    echo ============================================
    echo.
    echo This script needs to run as Administrator to modify the hosts file.
    echo Please right-click the script and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

:MENU
cls
echo ============================================
echo  ZAMUNDA.NET ^& ARENABG.COM FIX TOOL
echo ============================================
echo.
echo Checking hosts file status...
echo.

:: Check if entries already exist
findstr /C:"5.181.156.140 arenabg.com" "%SystemRoot%\System32\drivers\etc\hosts" >nul 2>&1
if %errorLevel% equ 0 (
    echo [✓] Hosts file entries already configured
    set HOSTS_CONFIGURED=1
) else (
    echo [!] Hosts file needs to be updated
    set HOSTS_CONFIGURED=0
)

echo.
echo ============================================
echo.

if %HOSTS_CONFIGURED%==0 (
    echo Step 1: Updating hosts file...
    echo.
    
    :: Backup hosts file first
    copy "%SystemRoot%\System32\drivers\etc\hosts" "%SystemRoot%\System32\drivers\etc\hosts.backup.%date:~-4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%" >nul 2>&1
    
    :: Remove old entries if they exist
    findstr /V /C:"arenabg.com" /C:"zamunda.net" "%SystemRoot%\System32\drivers\etc\hosts" > "%SystemRoot%\System32\drivers\etc\hosts.tmp"
    move /Y "%SystemRoot%\System32\drivers\etc\hosts.tmp" "%SystemRoot%\System32\drivers\etc\hosts" >nul
    
    :: Add new entries
    echo. >> "%SystemRoot%\System32\drivers\etc\hosts"
    echo # Zamunda and ArenaBG Fix >> "%SystemRoot%\System32\drivers\etc\hosts"
    echo 5.181.156.140 arenabg.com >> "%SystemRoot%\System32\drivers\etc\hosts"
    echo 5.181.156.140 www.arenabg.com >> "%SystemRoot%\System32\drivers\etc\hosts"
    echo 51.159.12.143 cdn.arenabg.com >> "%SystemRoot%\System32\drivers\etc\hosts"
    echo 104.21.23.130 zamunda.net >> "%SystemRoot%\System32\drivers\etc\hosts"
    echo 104.21.23.130 www.zamunda.net >> "%SystemRoot%\System32\drivers\etc\hosts"
    
    echo [✓] Hosts file updated successfully
    echo.
)

echo Step 2: Flushing DNS cache...
ipconfig /flushdns >nul 2>&1
echo [✓] DNS cache flushed
echo.
echo ============================================
echo.
echo IMPORTANT: After opening the website, press CTRL + F5 in your browser
echo to force a refresh and bypass cache!
echo.
echo ============================================
echo.
echo What would you like to do?
echo.
echo [1] Login to Zamunda.NET
echo [2] Login to Zamunda.CH
echo [3] Visit ArenaBG.com (no login needed)
echo [4] Just visit Zamunda.NET (if already logged in)
echo [5] Just visit Zamunda.CH (if already logged in)
echo [6] Exit
echo.
set /p choice="Enter your choice (1-6): "

if "%choice%"=="1" goto ZAMUNDA_NET_LOGIN
if "%choice%"=="2" goto ZAMUNDA_CH_LOGIN
if "%choice%"=="3" goto ARENABG_VISIT
if "%choice%"=="4" goto ZAMUNDA_NET_VISIT
if "%choice%"=="5" goto ZAMUNDA_CH_VISIT
if "%choice%"=="6" goto END

echo Invalid choice. Please try again.
timeout /t 2 >nul
goto MENU

:ZAMUNDA_NET_LOGIN
cls
echo ============================================
echo  ZAMUNDA.NET LOGIN
echo ============================================
echo.
set /p username="Enter your username: "
set /p password="Enter your password: "
echo.
echo Opening Zamunda.NET login page...
echo Remember to press CTRL + F5 once the page loads!
echo.
start "" "https://zamunda.net/takelogin.php?username=%username%&password=%password%"
timeout /t 3 >nul
goto MENU

:ZAMUNDA_CH_LOGIN
cls
echo ============================================
echo  ZAMUNDA.CH LOGIN
echo ============================================
echo.
set /p username="Enter your username: "
set /p password="Enter your password: "
echo.
echo Opening Zamunda.CH login page...
echo Remember to press CTRL + F5 once the page loads!
echo.
start "" "https://zamunda.ch/takelogin.php?username=%username%&password=%password%"
timeout /t 3 >nul
goto MENU

:ARENABG_VISIT
cls
echo ============================================
echo  OPENING ARENABG.COM
echo ============================================
echo.
echo Opening ArenaBG.com...
echo Remember to press CTRL + F5 once the page loads!
echo.
start "" "https://arenabg.com/"
timeout /t 3 >nul
goto MENU

:ZAMUNDA_NET_VISIT
cls
echo ============================================
echo  OPENING ZAMUNDA.NET
echo ============================================
echo.
echo Opening Zamunda.NET...
echo Remember to press CTRL + F5 once the page loads!
echo.
start "" "https://zamunda.net/"
timeout /t 3 >nul
goto MENU

:ZAMUNDA_CH_VISIT
cls
echo ============================================
echo  OPENING ZAMUNDA.CH
echo ============================================
echo.
echo Opening Zamunda.CH...
echo Remember to press CTRL + F5 once the page loads!
echo.
start "" "https://zamunda.ch/"
timeout /t 3 >nul
goto MENU

:END
cls
echo ============================================
echo  THANK YOU FOR USING THE FIX TOOL
echo ============================================
echo.
echo The hosts file has been updated and DNS cache flushed.
echo You can run this script again anytime you need to access the sites.
echo.
echo Press any key to exit...
pause >nul
exit
