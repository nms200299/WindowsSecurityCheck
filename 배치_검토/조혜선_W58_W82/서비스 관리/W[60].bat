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
net start | find /I "SNMP"
if %errorlevel% EQU 0 (
	echo 	�� ��ȣ ^(SNMP ���񽺸� ������� ����^)
    call %CHK_FILE% SAFE %1
) else (
	echo 	�� ��� ^(SNMP ���񽺸� �����^)
    echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SERVICES.MSC -^> SNMP Service �Ǵ�, SNMP ���� -^> �Ӽ����� ������ �������� ����� �� �ԡ����� ������ ��, SNMP ���񽺸� ������
	call %CHK_FILE% PWN %1
)
echo.
echo.