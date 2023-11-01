@echo off

echo [IIS 불필요한 파일 제거]
echo.

REM 불필요한 파일 제거
cd C:\inetpub\wwwroot
del /s *.bak

echo.
echo [작업 완료]
echo.

pause