@echo off
echo ###################################################################################
echo [W05] �������� - �ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ���� ����
echo.

echo �� ���� ����
echo 	��ȣ : "�ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ����" ��å�� "��� �� ��"���� �Ǿ� ����.
echo 	��� : "�ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ����" ��å�� "���"���� �Ǿ� ����.
echo.
echo.

echo �� ���� ���
call .\module\mod_createSecEdit.bat
set "filePath=.\module\tmp\securityPolicy.txt"
set "result="
setlocal enabledelayedexpansion
for /f "tokens=1-2 delims==" %%a in ('type %filePath%') do (
	if "%%a" == "ClearTextPassword " (
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
		echo 	�� ��ȣ ^(�ش� ��å�� ������� ����^)
		call %CHK_FILE% SAFE
	) else (
		echo 	�� ��� ^(�ش� ��å�� �����^)
		echo.
		echo.
		echo �� ��ġ ���
		echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ��ȣ ��å
		echo 	Step2^) "�ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ����"�� "��� �� ��"���� ����
		call %CHK_FILE% PWN
	)
	echo.
	echo.