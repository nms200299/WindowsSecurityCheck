@echo off

echo W-56 START
echo.
echo [W56] �ܼ� �α׿� �� ���� �������� �� ��ȣ ��� ����
echo.
echo �� ���� ��Ȳ

reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Lsa" /s | find /I "LimitBlankPasswordUse" | find "0x1" > nul
if %errorlevel% NEQ 0 (
    echo �� ���: ����
    echo �� ��ġ ���
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
    echo Step 2. "����: �ܼ� �α׿� �� ���� �������� �� ��ȣ ��� ����" ��å�� "���"���� ����
) else (
    echo �� ���: ����
)
