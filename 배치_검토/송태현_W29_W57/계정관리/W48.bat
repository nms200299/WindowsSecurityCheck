@echo off
echo ###################################################################################
echo [W48] ���� ���� - �н����� ���⼺ ����
echo.

echo �� ���� ����
echo 	��ȣ : ����ȣ�� ���⼺�� �����ؾ� �ԡ� ��å�� ����롱 ���� �Ǿ� �ִ� ���.
echo 	��� : ����ȣ�� ���⼺�� �����ؾ� �ԡ� ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ���
echo.
echo.

echo �� ���� ���
for /f "tokens=3" %%A in ('find /i "PasswordComplexity" ../tmp/securityPolicy.txt') do (
    set "PasswordComplexity=%%A"
)

if %PasswordComplexity% equ 0 (
	echo 	�� ��� ^(����ȣ�� ���⼺�� �����ؾ� �ԡ� ��å�� ����롱 ���� �Ǿ� �ִ� ���.^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ��ȣ ��å
	echo 	Step2^) "��ȣ�� ���⼺�� �����ؾ� ��"�� "���"���� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(����ȣ�� ���⼺�� �����ؾ� �ԡ� ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.