@echo off
echo ###################################################################################
echo [W50] ���� ���� - �н����� �ִ� ��� �Ⱓ
echo.

echo �� ���� ����
echo 	��ȣ : �ִ� ��ȣ ��� �Ⱓ�� 90�� ���Ϸ� �����Ǿ� �ִ� ���
echo 	��� : �ִ� ��ȣ ��� �Ⱓ�� �������� �ʾҰų� 90���� �ʰ��ϴ� ������ ������ ���
echo.
echo.

echo �� ���� ���
set "flag=0"
call .\module\mod_createSecEdit.bat
for /f "tokens=3" %%A in ('find /i "MaximumPasswordAge" .\module\tmp\securityPolicy.txt') do (
    set /a "MaximumPasswordAge=%%A"
)

if %MaximumPasswordAge% gtr 90 (set "flag=1")
if %MaximumPasswordAge% equ -1 (set "flag=1")

if !flag! equ 1 (
	echo 	�� ��� ^(�ִ� ��ȣ ��� �Ⱓ�� �������� �ʾҰų� 90���� �ʰ��ϴ� ������ ������ ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ��ȣ ��å
	echo 	Step2^) "�ִ� ��ȣ ��� �Ⱓ"�� "��� �Ⱓ"�� "90��"�� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(�ִ� ��ȣ ��� �Ⱓ�� 90�� ���Ϸ� �����Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.