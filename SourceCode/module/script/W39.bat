@echo off
echo ###################################################################################
echo [W39] ���� ���� - �α׿� ���� �ʰ� �ý��� ���� ��� ����
echo.

echo �� ���� ����
echo 	��ȣ :  ���α׿� ���� �ʰ� �ý��� ���� ��롱�� ����� �� �ԡ����� �����Ǿ� �ִ� ���
echo 	��� :  ���α׿� ���� �ʰ� �ý��� ���� ��롱�� ����롱���� �����Ǿ� �ִ� ���
echo.          
echo.

echo �� ���� �����
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" /s | find /I "shutdownwithoutlogon" | find "0x0" > nul
if %errorlevel% NEQ 0 (
    echo 	�� ��� ^(���α׿� ���� �ʰ� �ý��� ���� ��롱�� ����� �� �ԡ����� �����Ǿ� �ִ� ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ���� �ɼ�
    echo 	Step2^) "�ý��� ���� : �α׿� ���� �ʰ� �ý��� ���� ���"�� " ��� �� ��" ���� ����
	call %CHK_FILE% PWN %1
) else (
    echo 	�� ��ȣ ^(���α׿� ���� �ʰ� �ý��� ���� ��롱�� ����롱���� �����Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)

echo.
echo.