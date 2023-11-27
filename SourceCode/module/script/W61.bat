@echo off
echo ###################################################################################
echo [W61] ���� ���� - SNMP ���� Ŀ�´�Ƽ��Ʈ���� ���⼺ ����
echo.

echo �� ���� ����
echo 	��ȣ : SNMP ���񽺸� ������� �ʰų� Community String�� public, private�� �ƴ�.
echo 	��� : SNMP ���񽺸� ����ϸ�, Community String�� public, private�� ������.
echo.
echo.

echo �� ���� ���
net start | findstr /I /C:"SNMP Service"
if errorlevel 1 (
	echo 	�� ��ȣ ^(SNMP ���񽺸� ������� ����^)
    goto SAFE
) else (
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" | findstr /I /C:"0x4"
	if errorlevel 1 (
		echo 	�� ��� ^(�б� �������� ������ Community String�� ����^)
	    goto PWN
	) else (
		reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" | findstr /I /C:"public" >nul
		if not errorlevel 1 (
			echo 	�� ��� ^(Public���� ������ Community String�� ����^)
		    goto PWN
		)
		reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" | findstr /I /C:"private" >nul
		if not errorlevel 1 (
			echo 	�� ��� ^(Private���� ������ Community String�� ����^)
		    goto PWN
		)
		echo 	�� ��ȣ ^(Public, Private�� �ƴ� �б� ������ Community String�� ����^)
		goto SAFE
	)
)


:PWN
echo.
echo.
echo �� ��ġ ���
echo 	step1^) ���� -^> ���� -^> SERVICES.MSC -^> SNMP Service �Ǵ�, SNMP ����  �Ӽ� -^> ���� -^> '���� Ʈ�� ������' �Ʒ� '�߰�' ��ư
echo    step2^) 'SNMP ���� ����' -^> ���� ������ �ʿ����� �ʴٸ� Ŀ�´�Ƽ �̸��� �б� �������� Public/Private�� �ƴ� �̸��� �߰�
echo    step3^) ���� -^> ���� -^> SERVICES.MSC -^> SNMP Service �Ǵ�, SNMP ���� -^> �Ӽ� -^> '�Ϲ�' �ǿ��� ������ �������� ����� �� �ԡ����� ������ ��, SNMP ���� ����
call %CHK_FILE% PWN %1
goto CONTINUE

:SAFE
call %CHK_FILE% SAFE %1

:CONTINUE
echo.
echo.