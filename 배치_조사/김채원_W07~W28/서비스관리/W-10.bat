@echo off
echo ###################################################################################
echo [W10] ���� ���� - IIS���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  IIS ���񽺰� ���� ���� ���Դϴ�.
echo 	��� :  IIS ���񽺰� ���� ���� ������ �ʽ��ϴ�.
echo.
echo.

echo �� ���� ���
sc query "W3SVC" | find /I "RUNNING"
if errorlevel 1 (
    echo ���: W-10�� IIS ���񽺰� ���� ���� ������ �ʽ��ϴ�.
) else (
    echo ����: W-10�� IIS ���񽺰� ���� ���� ���Դϴ�.
)
echo.
echo.
pause