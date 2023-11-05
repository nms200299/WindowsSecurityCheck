@echo off

echo [IIS 파일 업로드 및 다운로드 제한]
echo.

REM IIS 파일 업로드 및 다운로드 제한 설정
%systemroot%\system32\inetsrv\appcmd set config /section:requestFiltering /fileExtensions.[fileExtension='.exe'].allowed:false
%systemroot%\system32\inetsrv\appcmd set config /section:requestFiltering /fileExtensions.[fileExtension='.bat'].allowed:false

echo.
echo [작업 완료]
echo.

pause