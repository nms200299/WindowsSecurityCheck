@echo off

echo [IIS CGI ���� ����]
echo.

REM IIS CGI ���� ���� ����
%systemroot%\system32\inetsrv\appcmd set config /section:isapiCgiRestriction /notListedCgisAllowed:false

echo.
echo [�۾� �Ϸ�]
echo.

pause