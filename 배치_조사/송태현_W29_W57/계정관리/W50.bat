@echo off

echo W-50 START
echo.
echo [W50] �н����� �ִ� ��� �Ⱓ
echo.
echo �� ���� ��Ȳ

for /f "tokens=3" %%A in ('find /i "MaximumPasswordAge" LocalSecurityPolicy.txt') do (
    set "MaximumPasswordAge=%%A"
)


if %MaximumPasswordAge% LSS 90 (
	echo �� ���: ����
	echo �� ��ġ ��� 
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��å - ��ȣ��å
	echo Step 2.  "�ִ� ��ȣ ��� �Ⱓ"�� "��� �Ⱓ"�� "90��"�� ����
) else (
	echo �� ���: ����
)