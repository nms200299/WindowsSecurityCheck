@echo off

echo W-51 START
echo.
echo [W51] �н����� �ּ� ��� �Ⱓ
echo.
echo �� ���� ��Ȳ

for /f "tokens=3" %%A in ('find /i "MinimumPasswordAge" LocalSecurityPolicy.txt') do (
    set "MinimumPasswordAge=%%A"
)


if %MinimumPasswordAge% equ 0 (
	echo �� ���: ����
	echo �� ��ġ ��� 
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��å - ��ȣ��å
	echo Step 2.  "�ּ� ��ȣ ��� �Ⱓ"���� "��� �Ⱓ"�� "1��"�� ����
) else (
	echo �� ���: ����
)