@echo off
echo ###################################################################################
echo [W58] ���� ���� - �͹̳� ���� ��ȣȭ ���� ����
echo.

echo �� ���� ����
echo  ��ȣ : �͹̳� ���񽺸� ������� �ʰų� ��� �� ��ȣȭ ������ ��Ŭ���̾�Ʈ�� ȣȯ ����(�߰�)�� �̻����� �����Ǿ� ����.
echo  ��� : �͹̳� ���񽺸� ����ϰ� ��ȣȭ ������ �������� ���� �����Ǿ� ����
echo.
echo.

echo �� ���� ���
net start | find /I "Remote Desktop Services"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" | find /I "MinEncryptionLevel"
if %errorlevel% EQU 0 (
	echo 	�� ��ȣ ^(Ŭ���̾�Ʈ�� ȣȯ ���� �߰� �̻����� ������^)
	call %CHK_FILE% SAFE %1
) else (
	echo 	�� ��� ^(�������� ���� ������^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> GPEDIT.MSC : ���� �׷� ��å ������
	echo 	Step2^) ��ǻ�� ����-^> ���� ���ø�-^> Windows ���� ��� -^> �͹̳� ���� -^> ���� ����ũ�� ���� ȣ��Ʈ -^> ����
	echo    Step3^) "Ŭ���̾�Ʈ ���� ��ȣȭ ���� ����" -^> "��ȣȭ ����"�� Ŭ���̾�Ʈ ȣȯ �������� ����
	call %CHK_FILE% PWN %1
)
echo.
echo.