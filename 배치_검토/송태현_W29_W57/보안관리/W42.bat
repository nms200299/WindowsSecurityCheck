@echo off
echo ###################################################################################
echo [W42] ���� ���� - SAM ������ ������ �͸� ���� ��� ����
echo.

echo �� ���� ����
echo 	��ȣ : �ش� ���� �ɼ� ���� ���� �Ǿ� �ִ� ���
echo 	��� : �ش� ���� �ɼ� ���� ���� �Ǿ� ���� �ʴ� ���
echo.
echo.

echo �� ���� ���
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | find /I "RestrictAnonymous" | find "0x1" > nul
if %errorlevel% NEQ 0 (
	echo 	�� ��� ^(�ش� ���� �ɼ� ���� ���� �Ǿ� ���� �ʴ� ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ���� �ɼ�
	echo 	Step2^) "��Ʈ��ũ �׼��� : SAM ������ ������ �͸� ���� ��� �� �ԡ��� ����Ʈ��ũ �׼��� :SAM ������ �͸� ���� ��� �� �ԡ��� ����롱 ����

) else (
	echo 	�� ��ȣ ^(�ش� ���� �ɼ� ���� ���� �Ǿ� �ִ� ���^)

)
echo.
echo.