@echo off

REM IIS ���� ���丮 �̸� ����
set "virtualDirectoryName=YourVirtualDirectory"

REM IIS ���� ������ ȣ���Ͽ� ���� ���丮 ����
appcmd delete vdir /vdir.name:"%virtualDirectoryName%"

REM ���� ��� �޽��� ���
if %errorlevel% equ 0 (
    echo ���� ���丮 "%virtualDirectoryName%"��(��) ���������� �����Ǿ����ϴ�.
) else (
    echo ���� ���丮 "%virtualDirectoryName%" ���� �� ������ �߻��߽��ϴ�.
)

pause