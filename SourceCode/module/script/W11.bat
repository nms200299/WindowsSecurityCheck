@echo off

echo [IIS ���丮 ������ ����]
echo.

REM IIS ���丮 ������ ����
%systemroot%\system32\inetsrv\appcmd set config /section:directoryBrowse /enabled:false

echo.
echo [�۾� �Ϸ�]
echo.

pause