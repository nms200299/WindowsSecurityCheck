@echo off

echo [IIS DB 연결 취약점 점검]
echo.

REM IIS 설정 파일 경로
set "configPath=C:\Windows\System32\inetsrv\config\applicationHost.config"

REM DB 연결 취약점 점검 설정
findstr /C:"<add name="ConnectionString" connectionString=" %configPath%

echo.
echo [작업 완료]
echo.

pause