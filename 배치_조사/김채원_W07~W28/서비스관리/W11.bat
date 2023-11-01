@echo off

echo [IIS 디렉토리 리스팅 제거]
echo.

REM IIS 디렉토리 리스팅 제거
%systemroot%\system32\inetsrv\appcmd set config /section:directoryBrowse /enabled:false

echo.
echo [작업 완료]
echo.

pause