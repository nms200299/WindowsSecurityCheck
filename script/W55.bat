@echo off

echo W-55 START
echo.
echo [W55] �ֱ� ��ȣ ���
echo.
echo �� ���� ��Ȳ

for /f "tokens=3" %%A in ('find /i "LSAAnonymousNameLookup" LocalSecurityPolicy.txt') do (
    set "LSAAnonymousNameLookup=%%A"
)


if %LSAAnonymousNameLookup% neq 0 (
	echo �� ���: ����
	echo �� ��ġ ��� 
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
	echo Step 2.   "��Ʈ��ũ �׼���: �͸� SID/�̸� ��ȯ ���" ��å�� "��� �� ��"���� ����
) else (
	echo �� ���: ����
)