@echo off

echo W-52 START
echo.
echo [W52] ������ ����� �̸� ǥ�� ����
echo.
echo �� ���� ��Ȳ

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" /s | find /I "DontDisplayLastUserName" | find "0x1" > nul
if %errorlevel% NEQ 0 (
    echo �� ���: ����
    echo �� ��ġ ���
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��ä - ���� �ɼ�
    echo Step 2. "��ȭ�� �α׿�: ������ ����� �̸� ǥ�� �� ��"�� "���"���� ����
) else (
    echo �� ���: ����
)
