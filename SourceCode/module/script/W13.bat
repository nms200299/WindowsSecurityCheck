@echo off

echo [IIS ���� ���ε� �� �ٿ�ε� ����]
echo.

REM IIS ���� ���ε� �� �ٿ�ε� ���� ����
%systemroot%\system32\inetsrv\appcmd set config /section:requestFiltering /fileExtensions.[fileExtension='.exe'].allowed:false
%systemroot%\system32\inetsrv\appcmd set config /section:requestFiltering /fileExtensions.[fileExtension='.bat'].allowed:false

echo.
echo [�۾� �Ϸ�]
echo.

pause