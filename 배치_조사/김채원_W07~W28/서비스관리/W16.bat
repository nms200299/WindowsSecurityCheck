@echo off

echo [IIS ��ũ ������]
echo.

REM IIS ��ũ ������ ����
netsh int ipv4 set global llmnr=disabled
netsh int ipv6 set global llmnr=disabled

echo.
echo [�۾� �Ϸ�]
echo.

pause