@echo off
echo ###################################################################################
echo [W32] �ֽ� HOT FIX ����
echo.

echo �� ���� ����
echo 	��ȣ :  �ֽ� Hotfix�� �ִ��� �ֱ������� ����͸��ϰ� �ݿ��ϰų�, PMS (Patch Management System) Agent�� ��ġ�Ǿ� �ڵ���ġ������ ����� ���
echo 	��� :  �ֽ� Hotfix�� �ִ��� �ֱ������� ����� ������ ���ų�, �ֽ� Hotfix�� �ݿ����� ���� ���, ���� PMS(Patch Management System) Agent�� ��ġ�Ǿ� ���� �ʰų�, ��ġ�Ǿ� ������ �ڵ���ġ������ ������� ���� ���
echo.
echo.

echo �� ���� �����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /s | find /I "AUOptions" | find "1" > nul
if %errorlevel% EQU 1 (
	echo 	�� ���� ^(�ǴܺҰ�^)
    echo �� ��ġ ���
	echo 	- ���� HOT FIX ���� -
	echo 	�Ʒ��� ����Ʈ���� ��ġ ����Ʈ�� ��ȸ�Ͽ�, ������ �ʿ��� ��ġ�� �����Ͽ� �������� ��ġ��
	echo	 https://technet.microsoft.com/ko-kr/security/
	echo 	- �ڵ� HOT FIX ���� -
	echo 	������ -^> windows update
	echo 	- PMS -
	echo 	Agent�� ��ġ�Ͽ� �ڵ����� ������Ʈ �ǵ��� ����
	call %CHK_FILE% WARN %1
)
echo.
echo.

