@echo off
echo W-41 START
echo.
echo [W41] ���Ȱ��縦 �α��� �� ���� ��� ��� �ý��� ���� ����
echo.
echo �� ���� ��Ȳ


reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | find /I "crashonauditfail" | find "0x0" > nul
if %errorlevel% NEQ 0 (
    echo �� ���: ����
    echo �� ��ġ ���
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
    echo Step 2. "���Ȱ��縦 �α��� �� ���� ��� ��� �ý��� ����"�� " ��� �� ��" ���� ����
) else (
    echo �� ���: ����
)
