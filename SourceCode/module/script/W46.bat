@echo off
echo ###################################################################################
echo [W46] ���� ���� - Everyone �������� �͸� ����ڿ� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ : ��Everyone ��� ������ �͸� ����ڿ��� ���롱 ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ���
echo 	��� : ��Everyone ��� ������ �͸� ����ڿ��� ���롱 ��å�� ����롱 ���� �Ǿ� �ִ� ���
echo.
echo.

echo �� ���� ���
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | find /I "everyoneincludesanonymous" | find "0x0" > nul
if %errorlevel% NEQ 0 (
	echo 	�� ��� ^(��� : ��Everyone ��� ������ �͸� ����ڿ��� ���롱 ��å�� ����롱 ���� �Ǿ� �ִ� ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ���� �ɼ�
	echo 	Step2^) "Everyone ��� ������ �͸� ����ڿ��� ����" ��å�� "��� �� ��"���� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(��Everyone ��� ������ �͸� ����ڿ��� ���롱 ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.