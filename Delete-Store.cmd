@echo off
for /f "tokens=6 delims=[]. " %%G in ('ver') do if %%G lss 16299 goto :version
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || goto :uac
setlocal enableextensions
if /i "%PROCESSOR_ARCHITECTURE%" equ "AMD64" (set "arch=x64") else (set "arch=x86")
cd /d "%~dp0"

set "PScommand=powershell -Command"

echo.
echo ============================================================
echo Removing Microsoft Store
echo ============================================================
echo.
%PScommand% "Get-AppxPackage *WindowsStore* | Remove-AppxPackage"
%PScommand% "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -EQ 'Microsoft.WindowsStore' | Remove-AppxProvisionedPackage -Online"

echo.
echo ============================================================
echo Removing Store Purchase App
echo ============================================================
echo.
%PScommand% "Get-AppxPackage *StorePurchaseApp* | Remove-AppxPackage"
%PScommand% "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -EQ 'Microsoft.StorePurchaseApp' | Remove-AppxProvisionedPackage -Online"

echo.
echo ============================================================
echo Removing App Installer
echo ============================================================
echo.
%PScommand% "Get-AppxPackage *DesktopAppInstaller* | Remove-AppxPackage"
%PScommand% "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -EQ 'Microsoft.DesktopAppInstaller' | Remove-AppxProvisionedPackage -Online"

echo.
echo ============================================================
echo Removing Xbox Identity Provider
echo ============================================================
echo.
%PScommand% "Get-AppxPackage *XboxIdentityProvider* | Remove-AppxPackage"
%PScommand% "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -EQ 'Microsoft.XboxIdentityProvider' | Remove-AppxProvisionedPackage -Online"

goto :fin

:uac
echo.
echo ============================================================
echo Error: Run the script as administrator
echo ============================================================
echo.
echo.
echo Press any key to Exit
pause >nul
exit

:version
echo.
echo ============================================================
echo Error: This pack is for Windows 10 version 1709 and later
echo ============================================================
echo.
echo.
echo Press any key to Exit
pause >nul
exit

:fin
echo.
echo ============================================================
echo Done
echo ============================================================
echo.
echo Press any Key to Exit.
pause >nul
exit
