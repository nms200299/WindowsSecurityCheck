@echo off
echo ###################################################################################
echo [W67] ���� ���� - �����͹̳� ���� Ÿ�Ӿƿ� ����
echo.

echo �� ���� ����
echo 	��ȣ : �������� �� Timeout ���� ������ ������.
echo 	��� : �������� �� Timeout ���� ������ �������� ����.
echo.
echo.

echo �� ���� ���
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" | findstr /I /C:"MaxIdleTime"
if errorlevel 1 (
	echo 	�� ��� ^(�������� �� Timeout ���� ������ �������� ����.^)
	echo.
	echo.
    echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> GPEDIT.MSC'���� �׷� ��å ������'
    echo    Step2^) ��ǻ�� ���� -^> ���� ���ø� -^> Windows ���� ��� -^> �͹̳� ���� -^> ���� ����ũ�� -^> ���� ȣ��Ʈ -^> ���� �ð� ����
    echo    Step3^) 'Ȱ�� �������� ���� �͹̳� ���� ���ǿ� �ð����� ����' -^> '���� ���� ����'�� 30������ ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(�������� �� Timeout ���� ������ ������.^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.
