@echo off

echo W-30 START
echo.
echo [W30]RDS(Remonte Data Services) ����
echo.
echo �� ���� ��Ȳ

reg query "HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\���� ���� ����" /s | find /I "SecureSecondaries" | find "0" > nul
if %errorlevel% NEQ 0 (
    echo �� ���: ����
) else (
    echo �� ���: ����
    echo �� ��ġ ���
		echo Step 1. ���� - ���� - DNSMGNT.MSC - �� ��ȸ ���� - �ش� ���� - �Ӽ� - ���� ����
		echo Step 2. "���� �����θ�" ���� �� ������ ���� IP �߰�
)