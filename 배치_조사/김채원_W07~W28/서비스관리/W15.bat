@echo off

echo [IIS 웹 프로세스 권한 제거]
echo.

REM 웹 프로세스 권한 제거 설정
%systemroot%\system32\inetsrv\appcmd set config /section:system.webServer/security/authentication/anonymousAuthentication /enabled:false

echo.
echo [작업 완료]
echo.

pause