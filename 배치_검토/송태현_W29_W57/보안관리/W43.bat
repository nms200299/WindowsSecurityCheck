@echo off
echo ###################################################################################
echo [W43] ���� ���� - Autologon ��� ����
echo.

echo �� ���� ����
echo 	��ȣ : AutoAdminLogon ���� ���ų� 0���� �����Ǿ� �ִ� ���
echo 	��� : AutoAdminLogon ���� 1�� �����Ǿ� �ִ� ���
echo.
echo.

echo �� ���� ���

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /s | find /I "AutoAdminLogon"  > nul
if %errorlevel% EQU 0 (
	reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /s | find /I "AutoAdminLogon" | find "1"  > nul
	if %errorlevel% EQU 0 (
		echo 	�� ��� ^(AutoAdminLogon ���� 1�� �����Ǿ� �ִ� ���^)
		echo.
		echo.
		echo �� ��ġ ���
		echo 	Step1^)���� -^> ���� -^> REGEDIT -^> HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
		echo 	Step2^)��AutoAdminLogon ������ ��0������ ����
		echo 	Step3^)DefaultPassword ��Ʈ���� �����Ѵٸ� ����
		call %CHK_FILE% PWN %1
	) else (
		echo 	�� ��ȣ ^(AutoAdminLogon ���� ���ų� 0���� �����Ǿ� �ִ� ���^)
		call %CHK_FILE% SAFE %1
	)

) else (
    echo 	�� ��ȣ ^(AutoAdminLogon ���� ���ų� 0���� �����Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)

echo.
echo.


