@echo off

echo [IIS 서비스 구동 점검]
echo.

REM IIS 서비스 구동 상태 확인
sc query W3SVC | findstr /i "STATE"

echo.
echo [작업 완료]
echo.

pause