@echo off

REM FTP ���� ���� Ȯ��
sc query ftpsvc | find "STATE" > nul

REM ��� Ȯ��
if %errorlevel% equ 0 (
    echo FTP ���񽺰� ���� ���� ���Դϴ�.
) else (
    echo FTP ���񽺰� ���� ������� �ʽ��ϴ�.
)

pause