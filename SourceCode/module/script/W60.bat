@echo off
echo ###################################################################################
echo [W60] ���� ���� - SNMP ���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ : SNMP ���񽺸� ������� ����.
echo 	��� : SNMP ���񽺸� �����.
echo.
echo.

echo �� ���� ���
net start | findstr /I /C:"SNMP Service"
if errorlevel 1 (
	echo 	�� ��ȣ ^(SNMP ���񽺸� ������� ����^)
    call %CHK_FILE% SAFE %1
) else (
	echo 	�� ��� ^(SNMP ���񽺸� �����^)
	echo.
	echo.
    echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SERVICES.MSC -^> SNMP Service �Ǵ�, SNMP ���� -^> �Ӽ����� ������ �������� ����� �� �ԡ����� ������ ��, SNMP ���񽺸� ������
	call %CHK_FILE% PWN %1
)
echo.
echo.