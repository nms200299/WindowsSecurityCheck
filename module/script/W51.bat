@echo off
echo ###################################################################################
echo [W51] ���� ���� - �н����� �ּ� ��� �Ⱓ
echo.

echo �� ���� ����
echo 	��ȣ : �ּ� ��ȣ ��� �Ⱓ�� 0���� ū ������ �����Ǿ� �ִ� ���
echo 	��� : �ּ� ��ȣ ��� �Ⱓ�� 0���� �����Ǿ� �ִ� ���
echo.
echo.

echo �� ���� ���
call .\module\mod_createSecEdit.bat
for /f "tokens=3" %%A in ('find /i "MinimumPasswordAge" .\module\tmp\securityPolicy.txt') do (
    set "MinimumPasswordAge=%%A"
)

if %MinimumPasswordAge% equ 0 (
	echo 	�� ��� ^(�ּ� ��ȣ ��� �Ⱓ�� 0���� �����Ǿ� �ִ� ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ��ȣ ��å
	echo 	Step2^) "�ּ� ��ȣ ��� �Ⱓ"���� "��� �Ⱓ"�� "1��"�� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(�ּ� ��ȣ ��� �Ⱓ�� 0���� ū ������ �����Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.