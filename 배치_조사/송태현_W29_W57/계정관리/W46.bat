@echo off
echo W-46 START
echo.
echo [W46] Everyone �������� �͸� ����ڿ� ���� ����
echo.
echo �� ���� ��Ȳ


reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | find /I "everyoneincludesanonymous" | find "0x0" > nul
if %errorlevel% NEQ 0 (
    echo �� ���: ����
    echo �� ��ġ ���
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
    echo Step 2. "Everyone ��� ������ �͸� ����ڿ��� ����" ��å�� "��� �� ��"���� ����
) else (
    echo �� ���: ����
)
