@echo off

echo [IIS �� ���μ��� ���� ����]
echo.

REM �� ���μ��� ���� ���� ����
%systemroot%\system32\inetsrv\appcmd set config /section:system.webServer/security/authentication/anonymousAuthentication /enabled:false

echo.
echo [�۾� �Ϸ�]
echo.

pause