@echo off
setlocal enabledelayedexpansion

echo W-57 START
echo.
echo [W57] �����͹̳� ���� ������ ����� �׷� ����
echo.
echo �� ���� ��Ȳ

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" ^| find "REG_DWORD"') do (
    set "fDenyTSConnections=%%A"
)

if !fDenyTSConnections! equ 0 (
    echo �����͹̳� ���� ������ ����� �׷�:
    net localgroup "Remote Desktop Users"
) else (
    echo �� ���: ����
    echo �� ��ġ ���
    echo ������ - �ý��� - ���� ���� - [����] �� - [���� ����ũ��] �޴� - "�� ��ǻ�Ϳ� ���� ���� ���� ���" �� üũ - "����� ����" 
)

endlocal
