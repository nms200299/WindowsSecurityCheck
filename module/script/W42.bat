@echo off
echo ###################################################################################
echo [W42] ���� ���� - SAM ������ ������ �͸� ���� ��� ����
echo.

echo �� ���� ����
echo 	��ȣ : �ش� ���� �ɼ� ���� ���� �Ǿ� �ִ� ���
echo 	��� : �ش� ���� �ɼ� ���� ���� �Ǿ� ���� �ʴ� ���
echo.
echo.

echo �� ���� ���
set "flag=0"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | findstr /I /C:"RestrictAnonymous " | find "0x1" > nul
if %errorlevel% NEQ 0 (
	set "flag=1"
)
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | findstr /I /C:"restrictanonymoussam " | find "0x1" > nul
if %errorlevel% NEQ 0 (
	set "flag=1"
)

if !flag! EQU 1 (
	echo 	�� ��� ^(�ش� ���� �ɼ� ���� ���� �Ǿ� ���� �ʴ� ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ���� �ɼ�
	echo 	Step2^) "��Ʈ��ũ �׼��� : ��SAM ������ ������ �͸� ���� ��� �� �ԡ���
	echo                              ����Ʈ��ũ �׼��� :SAM ������ �͸� ���� ��� �� �ԡ��� ����롱 ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(�ش� ���� �ɼ� ���� ���� �Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.