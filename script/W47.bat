@echo off

echo W-47 START
echo.
echo [W47] ���� ��� �Ⱓ ����
echo.
echo �� ���� ��Ȳ

for /f "tokens=3" %%A in ('find /i "LockoutBadCount" LocalSecurityPolicy.txt') do (
    set "LockoutBadCount=%%A"
)


if %LockoutBadCount% equ 0 (
	echo �� ���: ����
	echo �� ��ġ ��� 
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��å - ���� ��� ��å
	echo Step 2. "���� ��� �Ӱ谪" ������ "���� ��� �Ⱓ" �� "���� �ð� �� ���� ��� ���� ������� ����" �� ���� ���� - 60�� �̻��� ���� �ǰ�
) else (
	echo �� ���: ����
)

