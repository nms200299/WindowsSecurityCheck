@echo off
echo ###################################################################################
echo [W55] ���� ���� - �ֱ� ��ȣ ���
echo.

echo �� ���� ����
echo 	��ȣ : �ֱ� ��ȣ ����� 4�� �̻����� �����Ǿ� �ִ� ���
echo 	��� : �ֱ� ��ȣ ����� 4�� �̸����� �����Ǿ� �ִ� ���
echo.
echo.

echo �� ���� ���
for /f "tokens=3" %%A in ('find /i "PasswordHistorySize" ../tmp/securityPolicy.txt') do (
    set "PasswordHistorySize=%%A"
) 

if %PasswordHistorySize% lss 4 (
	echo 	�� ��� ^(�ֱ� ��ȣ ����� 4�� �̸����� �����Ǿ� �ִ� ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ��ȣ ��å
	echo 	Step2^) "�ֱ� ��ȣ ���"�� "4�� ��ȣ ����"���� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(�ֱ� ��ȣ ����� 4�� �̻����� �����Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.