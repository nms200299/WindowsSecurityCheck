@echo off
echo ###################################################################################
echo [W37] ���� ���� - SAM ���� ���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ : SAM ���� ���ٱ��ѿ� Administrator, System �׷츸 ��� �������� �����Ǿ� �ִ� ���
echo 	��� : SAM ���� ���ٱ��ѿ� Administrator, System �׷� �� �ٸ� �׷쿡 ������ �����Ǿ� �ִ� ���
echo.
echo.

echo �� ���� ���
icacls %systemroot%\system32\config\SAM | findstr /V /C:"SYSTEM" /C:"Administrator" /C:"NT AUTHORITY\SYSTEM" /C:"BUILTIN\Administrators" | FIND ":(F)"
if %errorlevel% EQU 0 (
	echo 	�� ��� ^(SAM ���� ���ٱ��ѿ� Administrator, System �׷츸 ��� �������� �����Ǿ� �ִ� ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) %systemroot%\system32\config\SAM -^> �Ӽ� -^> ����
	echo 	Step2^) Administratirm system �׷� �� �ٸ� ����� �� �׷� ���� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(SAM ���� ���ٱ��ѿ� Administrator, System �׷� �� �ٸ� �׷쿡 ������ �����Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.

