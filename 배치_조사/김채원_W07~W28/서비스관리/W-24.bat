@echo off
echo ###################################################################################
echo [W24] ���� ���� - NetBIOS ���ε� ���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  TCP/IP�� NetBIOS ���� ���ε��� ���� �Ǿ� �ִ� ���
echo 	��� :  TCP/IP�� NetBIOS ���� ���ε��� ���� �Ǿ� ���� �ʴ� ���
echo.
echo.

echo �� ���� �����
set "netbiosStatus="
for /f "tokens=3*" %%i in ('sc query NetBT ^| find "STATE"') do set "netbiosStatus=%%j"

if not "!netbiosStatus!"=="" (
    echo NetBIOS ���ε� ���񽺰� ���� ���� ���Դϴ�.

    REM ��� ���·� �Ǵ��ϰ� ��ġ ����� �ȳ��մϴ�.
    echo ���


) else (
    echo NetBIOS ���ε� ���񽺰� ���� ��Ȱ��ȭ�Ǿ� �ֽ��ϴ�.
    echo ��ȣ
)
echo.
echo.
pause