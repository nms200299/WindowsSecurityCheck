@echo off

echo [IIS ���� ���� ����]
echo.

REM IIS ���� ���� ���� Ȯ��
sc query W3SVC | findstr /i "STATE"

echo.
echo [�۾� �Ϸ�]
echo.

pause