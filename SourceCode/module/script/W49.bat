@echo off

echo W-49 START
echo.
echo [W49] �н����� �ּ� ��ȣ ����
echo.
echo �� ���� ��Ȳ

for /f "tokens=3" %%A in ('find /i "MinimumPasswordLength" LocalSecurityPolicy.txt') do (
    set "MinimumPasswordLength=%%A"
)

if %MinimumPasswordLength% equ 0 (
	echo �� ���: ����
	echo �� ��ġ ��� 
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��å - ��ȣ��å
	echo Step 2.  "�ּ� ��ȣ ����"�� "8����"�̻����� ����
) else (
	echo �� ���: ����
)