@echo off
echo ###################################################################################
echo [W41] ���� ���� - ���� ���縦 �α��� �� ���� ��� ��� �ý��� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ : ������ ���縦 �α��� �� ���� ��� ��� �ý��� ���ᡱ ��å�� ����� �� �ԡ���.
echo 	��� : : ������ ���縦 �α��� �� ���� ��� ��� �ý��� ���ᡱ ��å�� ����롱��.
echo.
echo.

echo �� ���� ���
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | find /I "crashonauditfail" | find "0x0" > nul
if %errorlevel% NEQ 0 (
	echo 	�� ��� ^(������ ���縦 �α��� �� ���� ��� ��� �ý��� ���ᡱ ��å�� ����롱��^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��ä -^> ���� �ɼ�
	echo 	Step2^) "���� ���縦 �α��� �� ���� ��� ��� �ý��� ����"�� " ��� �� ��" ���� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(������ ���縦 �α��� �� ���� ��� ��� �ý��� ���ᡱ ��å�� ����� �� �ԡ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.