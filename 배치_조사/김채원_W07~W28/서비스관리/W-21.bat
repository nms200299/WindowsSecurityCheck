@echo off
echo ###################################################################################
echo [W21] ���� ���� - IIS �̻�� ��ũ��Ʈ ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  ����� ������ �������� �ʴ� ���
echo 	��� :  ����� ������ �����ϴ� ���
echo.
echo.

echo �� ���� �����

set "scriptMapping=C:\Windows\System32\inetsrv\config\schema\ScriptMap_4.0_0_0"
if exist "!scriptMapping!" (
    echo ���� IIS �̻�� ��ũ��Ʈ ���� ������ ã�ҽ��ϴ�.

    REM ���� ������ ����մϴ�.
    type "!scriptMapping!"

echo 	��� :  ����� ������ �����ϴ� ���

    REM ��ġ ��� �ȳ�
	echo �� ��ġ ���
    echo 1. IIS �����ڸ� ����, �ش� ������ Ȯ���ϰ� �����մϴ�.
    echo 2. ���� ������Ʈ �� ���� ������ �����մϴ�.

) else (
echo 	��ȣ :  ����� ������ �������� ����
)
echo.
echo.
pause