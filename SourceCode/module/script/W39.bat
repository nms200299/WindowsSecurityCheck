@echo off
echo W-39 START
echo.
echo [W39] �α׿� ���� �ʰ� �ý��� ���� ��� ����
echo.
echo �� ���� ��Ȳ


reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" /s | find /I "shutdownwithoutlogon" | find "0x0" > nul
if %errorlevel% NEQ 0 (
    echo �� ���: ����
    echo �� ��ġ ���
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��ä - ���� �ɼ�
    echo Step 2. "�ý��� ���� : �α׿� ���� �ʰ� �ý��� ���� ���"�� " ��� �� ��" ���� ����
) else (
    echo �� ���: ����
)

endlocal
