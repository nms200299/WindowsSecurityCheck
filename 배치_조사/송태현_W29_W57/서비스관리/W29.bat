@echo off

echo W-29 START
echo.
echo [W29] DNS Zone Transfer ���� 
echo.
echo �� ���� ��Ȳ

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\DNS�ּ�" /s | find /I "SecureSecondaries" | find "0" > nul
if %errorlevel% NEQ 0 (
    echo �� ���: ����
) else (
    echo �� ���: ����
    echo �� ��ġ ���
		echo Step 1. ���� - ���� - DNSMGNT.MSC - �� ��ȸ ���� - �ش� ���� - �Ӽ� - ���� ����
		echo Step 2. "���� �����θ�" ���� �� ������ ���� IP �߰�
)