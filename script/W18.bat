@echo off

echo [IIS DB ���� ����� ����]
echo.

REM IIS ���� ���� ���
set "configPath=C:\Windows\System32\inetsrv\config\applicationHost.config"

REM DB ���� ����� ���� ����
findstr /C:"<add name="ConnectionString" connectionString=" %configPath%

echo.
echo [�۾� �Ϸ�]
echo.

pause