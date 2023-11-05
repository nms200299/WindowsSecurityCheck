@echo off

echo [IIS 링크 사용금지]
echo.

REM IIS 링크 사용금지 설정
netsh int ipv4 set global llmnr=disabled
netsh int ipv6 set global llmnr=disabled

echo.
echo [작업 완료]
echo.

pause