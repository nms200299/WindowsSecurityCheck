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
net start | findstr /I /C:"SNMP Service"
if errorlevel 1 (
	echo 	�� ��ȣ ^(SNMP ���񽺸� ������� ����^)
    call %CHK_FILE% SAFE %1
) else (
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" /v 1
	if errorlevel 1 (
		echo 	�� ��� ^(��� ȣ��Ʈ�κ��� SNMP ��Ŷ�� �޾Ƶ���^)
		echo.
		echo.
	    echo �� ��ġ ���
		echo 	step1^) ���� -^> ���� -^> SERVICES.MSC -^> SNMP Service �Ǵ�, SNMP ����  �Ӽ� -^> ����
		echo    step2^) ������ Ʈ�� �����⡱ �� ������ ȣ��Ʈ�κ��� SNMP ��Ŷ �޾Ƶ��̱⡱ ����
	    echo    step3^) SNMP ȣ��Ʈ ���
	    call %CHK_FILE% PWN %1
	) else (
		echo 	�� ��ȣ ^(Ư�� ȣ��Ʈ�κ��� SNMP ��Ŷ�� �޾Ƶ���^)
	    call %CHK_FILE% SAFE %1
	)
)




echo.
echo.