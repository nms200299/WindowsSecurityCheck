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
set "flag=0"
for /F "delims=" %%a in ('icacls %systemroot%\system32\config\SAM ^| findstr /V /C:"SYSTEM" /C:"Administrator" /C:"NT AUTHORITY\SYSTEM" /C:"BUILTIN\Administrators" /C:"ó��"') do (
	echo %%a | findstr /C:"ó��" >nul
	if errorlevel 1 (
		set "flag=1"
	)
)

if !flag! EQU 1 (
	echo 	�� ��� ^(SAM ���� ���ٱ��ѿ� Administrator, System �׷� �� �ٸ� �׷쿡 ������ ������^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ^%systemroot^%\system32\config\SAM -^> �Ӽ� -^> ����
	echo 	Step2^) Administratirm system �׷� �� �ٸ� ����� �� �׷� ���� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(SAM ���� ���ٱ��ѿ� Administrator, System �׷츸 ��� �������� ������^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.

