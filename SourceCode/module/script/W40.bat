@echo off
echo ###################################################################################
echo [W40] ���� ���� - ���� �ý��ۿ��� ������ �ý��� ����
echo.

echo �� ���� ����
echo 	��ȣ :  ������ �ý��ۿ��� ������ �ý��� ���ᡱ ��å�� ��Administrators���� �����ϴ� ���
echo 	��� :  : ������ �ý��ۿ��� ������ �ý��� ���ᡱ ��å�� ��Administrators�� �� �ٸ� ���� �� �׷��� �����ϴ� ���
echo.          
echo.

echo �� ���� ���
set "flag=0"
call .\module\mod_createSecEdit.bat

for /F "tokens=1-3 delims=," %%a in ('type .\module\tmp\securityPolicy.txt ^| find /i "SeRemoteShutdownPrivilege"') do (
	echo %%a | findstr /C:"SeRemoteShutdownPrivilege = *S-1-5-32-544"
	if errorlevel 1 (
		set "flag=1"
	)
	rem ù ��° ������ S-1-5-32-544�� �ƴϸ� ���


	if "%%b" NEQ "" (
		set "flag=1"
	)
	rem �� ��° ������ ������ ���

)



if !flag! EQU 1 (
	echo 	�� ��� ^(Administrators^(S-1-5-32-544^)�� �������� �ʽ��ϴ�^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ����� ���� �Ҵ�
	echo 	Step2^) ������ �ý��ۿ��� ������ �ý��� ���ᡱ ��å�� Administrators �� �ٸ� ���� �� �׷� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(Administrators^(S-1-5-32-544^)�� �����մϴ�^)
	call %CHK_FILE% SAFE %1
)

echo.
echo.
