@echo off
setlocal enableextensions


set Framework22_64=%Temp%\
set Framework22_86=%Temp%\
set Runtime22_64=%Temp%\
set Runtime22_86=%Temp%\
set Xaml24_64=%Temp%\
set Xaml24_86=%Temp%\
set Xaml27_64=%Temp%\
set Xaml27_86=%Temp%\
set Xaml28_64=%Temp%\
set Xaml28_86=%Temp%\
set VCLibsUWP_64=%Temp%\
set VCLibsUWP_86=%Temp%\
set VCLibs_64=%Temp%\
set VCLibs_86=%Temp%\

set Store=%Temp%\
set StoreXML=%Temp%\

set TCUI=%Temp%\
set TCUIXML=%Temp%\

set GameBarPlugin=%Temp%\
set GameBarPluginXML=%Temp%\

set GameBar=%Temp%\
set GameBarXML=%Temp%\

set IdentityProvider=%Temp%\
set IdentityProviderXML=%Temp%\

set SpeechToTextOverlay=%Temp%\
set SpeechToTextOverlayXML=%Temp%\

set GamingServices=%Temp%\
set GamingServicesXML=%Temp%\





%PScommand% Add-AppxProvisionedPackage -Online -PackagePath %Store% -DependencyPackagePath %DepStore% -LicensePath Microsoft.WindowsStore_8wekyb3d8bbwe.xml


set "PScommand=PowerShell -NoLogo -NoProfile -NonInteractive -InputFormat None -ExecutionPolicy Bypass"

echo.
echo ============================================================
echo Adding Microsoft Store
echo ============================================================
echo.
1>nul 2>nul %PScommand% Add-AppxProvisionedPackage -Online -PackagePath %Store% -DependencyPackagePath %DepStore% -LicensePath Microsoft.WindowsStore_8wekyb3d8bbwe.xml
for %%i in (%DepStore%) do (
%PScommand% Add-AppxPackage -Path %%i
)
%PScommand% Add-AppxPackage -Path %Store%

if defined PurchaseApp (
echo.
echo ============================================================
echo Adding Store Purchase App
echo ============================================================
echo.
1>nul 2>nul %PScommand% Add-AppxProvisionedPackage -Online -PackagePath %PurchaseApp% -DependencyPackagePath %DepPurchase% -LicensePath Microsoft.StorePurchaseApp_8wekyb3d8bbwe.xml
%PScommand% Add-AppxPackage -Path %PurchaseApp%
)
if defined AppInstaller (
echo.
echo ============================================================
echo Adding App Installer
echo ============================================================
echo.
1>nul 2>nul %PScommand% Add-AppxProvisionedPackage -Online -PackagePath %AppInstaller% -DependencyPackagePath %DepInstaller% -LicensePath Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.xml
%PScommand% Add-AppxPackage -Path %AppInstaller%
)
if defined XboxIdentity (
echo.
echo ============================================================
echo Adding Xbox Identity Provider
echo ============================================================
echo.
1>nul 2>nul %PScommand% Add-AppxProvisionedPackage -Online -PackagePath %XboxIdentity% -DependencyPackagePath %DepXbox% -LicensePath Microsoft.XboxIdentityProvider_8wekyb3d8bbwe.xml
%PScommand% Add-AppxPackage -Path %XboxIdentity%
)
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

:nofiles
echo.
echo ============================================================
echo Error: Required files are missing in the current directory
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
