@echo off
echo ###################################################################################
echo [W35] �������� �׼��� �� �� �ִ� ������Ʈ�� ���
echo.

echo �� ���� ����
echo 	��ȣ : Remote Registry Service�� �����Ǿ� �ִ� ���
echo 	��� : Remote Registry Service�� ���� ���� ���
echo.
echo.

echo �� ���� ���
net start | find /I "Remote Registry" > nul
if %errorlevel% EQU 0 (
	echo 	�� ��� ^(Remote Registry Service�� ���� ��^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SERVICES.MSC -^> Remote Registry -^> �Ӽ�
	echo 	Step2^) ���� ���� -^> ��� ����
	echo 	Step3^) ���� ���� -^> ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(Remote Registry Service�� ������^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.