@echo off

REM NetBIOS ���ε� ���� ���� Ȯ��
sc query NetBT | find "STATE" > nul

REM ��� Ȯ��
if %errorlevel% equ 0 (
    echo NetBIOS ���ε� ���񽺰� ���� ���� ���Դϴ�.
) else (
    echo NetBIOS ���ε� ���񽺰� ���� ������� �ʽ��ϴ�.
)

pause