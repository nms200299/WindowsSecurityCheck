@echo off

echo [IIS CGI 실행 제한]
echo.

REM IIS CGI 실행 제한 설정
%systemroot%\system32\inetsrv\appcmd set config /section:isapiCgiRestriction /notListedCgisAllowed:false

echo.
echo [작업 완료]
echo.

pause