@echo off

echo [���ʿ��� ���� ����]
echo.

REM ���� ����
echo - Windows Media Player Network Sharing Service ����
sc delete WMPNetworkSvc

echo - Print Spooler ���� ����
sc delete Spooler

echo - Fax ���� ����
sc delete Fax

echo - TabletInputService ���� ����
sc delete TabletInputService

echo.
echo [�۾� �Ϸ�]
echo.

pause