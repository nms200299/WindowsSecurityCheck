@echo off
echo ###################################################################################
echo [W04] ���� ���� - ���� ��� �Ӱ谪 ����
echo.

echo �� ���� ����
echo 	��ȣ : ���� ��� �Ӱ谪�� 5 ������ ������ �����Ǿ� ����.
echo 	��� : ���� ��� �Ӱ谪�� 6 �̻��� ������ �����Ǿ� ����.
echo.
echo.

echo �� ���� ���
call .\module\mod_createSecEdit.bat
set "filePath=.\module\tmp\securityPolicy.txt"
set "result="
setlocal enabledelayedexpansion
for /f "tokens=1-2 delims==" %%a in ('type %filePath%') do (
	if "%%a" == "LockoutBadCount " (
		echo %%a=%%b
		set "result=%%b"
		rem �׸��� ���� ����ϰ� ���� ������ ����
		set "result=!result:~1,1!"
		rem ������ �����̽� �ڸ�
		set /a "result=!result!"
		rem ���� ����� ��ȯ
		goto break
	)
)
:break
	if !result! EQU 0 (
		echo 	�� ��� ^(���� ��� �Ӱ谪�� 0^(�ƴ�^)�̶�� �����Ǿ� ����^)
		goto pwn
	) else if !result! GEQ 6 (
		echo 	�� ��� ^(���� ��� �Ӱ谪�� 6 �̻����� �����Ǿ� ����^)
		goto pwn
	) else (
		echo 	�� ��ȣ (���� ��� �Ӱ谪�� 0 �ʰ�, 5 ���Ϸ� �����Ǿ� ����)
		call %CHK_FILE% SAFE %1
		goto next
	)

:pwn
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ���� ��� ��å
	echo 	Step2^) "���� ��� �Ӱ谪"�� "5"������ ������ ����
	call %CHK_FILE% PWN %1
	goto next
:next
	echo.
	echo.