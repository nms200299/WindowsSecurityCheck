@echo off

echo [불필요한 서비스 제거]
echo.

REM 서비스 제거
echo - Windows Media Player Network Sharing Service 제거
sc delete WMPNetworkSvc

echo - Print Spooler 서비스 제거
sc delete Spooler

echo - Fax 서비스 제거
sc delete Fax

echo - TabletInputService 서비스 제거
sc delete TabletInputService

echo.
echo [작업 완료]
echo.

pause