@echo off
echo ###################################################################################
echo [W52] ���� ���� - ������ ����� �̸� ǥ�� ����
echo.

echo �� ���� ����
echo 	��ȣ : �������� ����� �̸� ǥ�� �� �ԡ��� ����롱���� �����Ǿ� �ִ� ���
echo 	��� : �������� ����� �̸� ǥ�� �� �ԡ��� ����� �� �ԡ����� �����Ǿ� �ִ� ���
echo.
echo.

echo �� ���� ���
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" /v "DontDisplayLastUserName" | findstr /C:"0x1" > nul
if errorlevel 1 (
	echo 	�� ��� ^(�������� ����� �̸� ǥ�� �� �ԡ��� ����� �� �ԡ����� �����Ǿ� �ִ� ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ���� �ɼ�
	echo 	Step2^) "��ȭ�� �α׿�: ������ ����� �̸� ǥ�� �� ��"�� "���"���� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(�������� ����� �̸� ǥ�� �� �ԡ��� ����롱���� �����Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.