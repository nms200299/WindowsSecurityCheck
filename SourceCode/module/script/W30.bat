@echo off
echo ###################################################################################
echo [W30] RDS(Remote Data Services) ����
echo.

echo �� ���� ����
echo    ��ȣ : IIS�� ������� �ʴ� ���, Windows 2000 ������ 4, Windows 2003 ������ 2 �̻� ��ġ�Ǿ� �ִ� ���,
echo        ����Ʈ �� ����Ʈ�� MSADC ���� ���丮�� �������� �ʴ� ���, �ش� ������Ʈ�� ���� �������� �ʴ� ���
echo    ��� : ��ȣ ���ؿ� �� ������ �ش���� �ʴ� ���
echo.
echo.

echo �� ���� ���
for /f "tokens=2 delims=[]" %%A in ('ver') do (
    for /f "tokens=2" %%B in ("%%A") do (
        set "version_number=%%B"
    )
)

if !version_number! LSS 6 (
    echo 	�� ���� ^(�Ǵ� �Ұ�^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> INETMGR -^> �� ����Ʈ ���� �� ������ ���丮���� msadc ����
	echo 	Step2^) ������ ������Ʈ�� Ű/���丮 ����
	echo	HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\RDSServer.DataFactory
	echo	HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\AdvancedDataFactory
	echo	HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\VbBusObj.VbBusObjCl
	call %CHK_FILE% WARN %1
) else (
	echo 	�� ��ȣ ^(Windows Server 2008 �̻�^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.
