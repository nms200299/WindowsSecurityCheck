@echo off
echo W-43 START
echo.
echo [W43] Autologon ��� ����
echo.
echo �� ���� ��Ȳ


reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Winlogon" /s | find /I "AutoAdminLogon"  > nul
if %errorlevel% EQU 0 (
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Winlogon" /s | find /I "AutoAdminLogon" | find "1"  > nul
	if %errorlevel% EQU 0 (
		echo �� ���: ����
		echo �� ��ġ ���
		echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��ä - ���� �ɼ�
    	echo Step 2. "SAM ������ ������ �͸� ���� ��� ����"�� " ���" ���� ����
	) else (
		echo �� ���: ����
	)

) else (
    echo �� ���: ����
)

endlocal
