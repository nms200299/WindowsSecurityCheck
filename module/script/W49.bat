@echo off
echo ###################################################################################
echo [W49] ���� ���� - �н����� �ּ� ��ȣ ����
echo.

echo �� ���� ����
echo 	��ȣ : �ּ� ��ȣ ���̰� 8���� �̻����� �����Ǿ� �ִ� ���
echo 	��� : �ּ� ��ȣ ���̰� �������� �ʾҰų� 8���� �̸����� �����Ǿ� �ִ� ���
echo.
echo.

echo �� ���� ���
call .\module\mod_createSecEdit.bat
for /f "tokens=3" %%A in ('find /i "MinimumPasswordLength" .\module\tmp\securityPolicy.txt') do (
    set "MinimumPasswordLength=%%A"
)

if %MinimumPasswordLength% lss 8 (
	echo 	�� ��� ^(�ּ� ��ȣ ���̰� �������� �ʾҰų� 8���� �̸����� �����Ǿ� �ִ� ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ��ȣ ��å
	echo 	Step2^) "�ּ� ��ȣ ����"�� "8����"�̻����� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(�ּ� ��ȣ ���̰� 8���� �̻����� �����Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.