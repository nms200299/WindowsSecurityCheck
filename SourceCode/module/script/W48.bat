@echo off

echo W-48 START
echo.
echo [W48] �н����� ���⼺ ����
echo.
echo �� ���� ��Ȳ

for /f "tokens=3" %%A in ('find /i "PasswordComplexity" LocalSecurityPolicy.txt') do (
    set "PasswordComplexity=%%A"
)


if %PasswordComplexity% equ 0 (
	echo �� ���: ����
	echo �� ��ġ ��� 
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��å - ��ȣ��å
	echo Step 2.  "��ȣ�� ���⼺�� �����ؾ� ��"�� "���"���� ����
) else (
	echo �� ���: ����
)