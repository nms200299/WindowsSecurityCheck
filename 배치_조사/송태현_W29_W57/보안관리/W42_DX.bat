@echo off
echo W-42 START
echo.
echo [W42] SAM ������ ������ �͸� ���� ��� ����
echo.
echo �� ���� ��Ȳ


reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | find /I "RestrictAnonymous" | find "0x1" > nul
if %errorlevel% NEQ 0 (
    echo �� ���: ����
    echo �� ��ġ ���
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��ä - ���� �ɼ�
    echo Step 2. "SAM ������ ������ �͸� ���� ��� ����"�� " ���" ���� ����
) else (
    echo �� ���: ����
)

endlocal
