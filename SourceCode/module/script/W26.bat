@echo off

REM FTP ���͸� ��� ����
set "ftpDirectory=C:\Path\To\Your\FTP\Directory"

REM FTP ���͸��� ���� ���� ���� ����
icacls "%ftpDirectory%" /grant "FTP Users:(OI)(CI)RX" /grant "Administrator:(OI)(CI)F"

REM ���� ��� �޽��� ���
if %errorlevel% equ 0 (
    echo FTP ���͸��� ���� ���� ������ ���������� �����Ǿ����ϴ�.
) else (
    echo FTP ���͸��� ���� ���� ���� ���� �� ������ �߻��߽��ϴ�.
)

pause