@echo off
echo ###################################################################################
echo [W54] ���� ���� - �͸� SID/�̸� ��ȯ ��� ����
echo.

echo �� ���� ����
echo 	��ȣ : ���͸� SID/�̸� ��ȯ ��롱 ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ���
echo 	��� : ���͸� SID/�̸� ��ȯ ��롱 ��å�� ����롱 ���� �Ǿ� �ִ� ���
echo.
echo.

echo �� ���� ���
call .\module\mod_createSecEdit.bat
for /f "tokens=3" %%A in ('find /i "LSAAnonymousNameLookup" .\module\tmp\securityPolicy.txt') do (
    set "LSAAnonymousNameLookup=%%A"
)

if %LSAAnonymousNameLookup% neq 0 (
	echo 	�� ��� ^(���͸� SID/�̸� ��ȯ ��롱 ��å�� ����롱 ���� �Ǿ� �ִ� ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ���� �ɼ�
	echo 	Step2^) "��Ʈ��ũ �׼���: �͸� SID/�̸� ��ȯ ���" ��å�� "��� �� ��"���� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(���͸� SID/�̸� ��ȯ ��롱 ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.