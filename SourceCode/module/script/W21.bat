@echo off

REM IIS ����Ʈ �̸� ����
set "siteName=YourSiteName"

REM �̻�� ��ũ��Ʈ ���� ����
appcmd set config "%siteName%" -section:handlers /-[name='YourHandlerName']

REM ���� ��� �޽��� ���
if %errorlevel% equ 0 (
    echo �̻�� ��ũ��Ʈ ������ ���������� ���ŵǾ����ϴ�.
) else (
    echo �̻�� ��ũ��Ʈ ���� ���� �� ������ �߻��߽��ϴ�.
)

pause