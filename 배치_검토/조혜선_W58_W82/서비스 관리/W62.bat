@echo off
echo ###################################################################################
echo [W62] ���� ���� - SNMP Access control ����
echo.

echo �� ���� ����
echo 	��ȣ : Ư�� ȣ��Ʈ�κ��� SNMP ��Ŷ �޾Ƶ��̱�� �����Ǿ� ����.
echo 	��� : ��� ȣ��Ʈ�κ��� SNMP ��Ŷ �޾Ƶ��̱�� �����Ǿ� ����.
echo.
echo.

echo �� ���� ���
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers /v 1 > nul
if %errorlevel% EQU 0 (
	echo 	�� ��� ^(SNMP ���񽺸� ������� ����^)
    echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SERVICES.MSC -^> SNMP Service �Ǵ�, SNMP ����  �Ӽ� -^> ����
	echo    Step2^) ������ Ʈ�� �����⡱ �� ������ ȣ��Ʈ�κ��� SNMP ��Ŷ �޾Ƶ��̱⡱ ����
    echo    Step3^) SNMP ȣ��Ʈ ���
    call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(SNMP ���񽺸� �����^)
    call %CHK_FILE% SAFE %1
)
echo.
echo.