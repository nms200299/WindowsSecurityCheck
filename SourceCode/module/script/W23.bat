@echo off

REM WebDAV ��� ��Ȱ��ȭ
dism /online /disable-feature /featurename:IIS-WebDAV

REM ���� ��� �޽��� ���
if %errorlevel% equ 0 (
    echo WebDAV ����� ���������� ��Ȱ��ȭ�Ǿ����ϴ�.
) else (
    echo WebDAV ��� ��Ȱ��ȭ �� ������ �߻��߽��ϴ�.
)

pause