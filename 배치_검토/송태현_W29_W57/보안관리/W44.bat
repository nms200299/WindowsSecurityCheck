@echo off
echo ###################################################################################
echo [W44] ���� ���� - �̵��� �̵�� ���� �� ������ ���
echo.

echo �� ���� ����
echo 	��ȣ : ���̵��� �̵�� ���� �� ������ ��롱 ��å�� ��Administrator���� �Ǿ� �ִ� ���
echo 	��� : ���̵��� �̵�� ���� �� ������ ��롱 ��å�� ��Administrator���� �Ǿ� ���� ���� ���
echo.
echo.

echo �� ���� ���
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /s | find /I "AllocateDASD" |find "0" > nul
if %errorlevel% NEQ 0 (
	echo 	�� ��� ^(���̵��� �̵�� ���� �� ������ ��롱 ��å�� ��Administrator���� �Ǿ� ���� ���� ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ���� �ɼ�
	echo 	Step2^) ����ġ : �̵��� �̵�� ���� �� ������ ��롱 ��å�� ��Administrators�� �� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(���̵��� �̵�� ���� �� ������ ��롱 ��å�� ��Administrator���� �Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.