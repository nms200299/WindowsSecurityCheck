@echo off

REM ������ ���� �Ǵ� ���丮 ��� ����
set "dataPath=C:\Path\To\Your\Data"

REM ACL ���� ����
icacls "%dataPath%" /grant "IIS_IUSRS:(OI)(CI)M"

REM ���� ��� �޽��� ���
if %errorlevel% equ 0 (
    echo ACL ���� ������ ���������� �Ϸ�Ǿ����ϴ�.
) else (
    echo ACL ���� ���� �� ������ �߻��߽��ϴ�.
)

pause