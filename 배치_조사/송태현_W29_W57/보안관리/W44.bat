@echo off
echo W-44 START
echo.
echo [W44] �̵��� �̵�� ���� �� ������ ���
echo.
echo �� ���� ��Ȳ


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /s | find /I "AllocateDASD" |find "0" > nul
if %errorlevel% NEQ 0 (
	echo �� ���: ����
	echo �� ��ġ ���
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��ä - ���� �ɼ�
	echo Step 2. ����ġ : �̵��� �̵�� ���� �� ������ ��롱 ��å�� ��Administrators�� �� ����
) else (
    echo �� ���: ����
)

endlocal
