@echo off
echo ###################################################################################
echo [W65] ���� ���� - Telnet ���� ����
echo.

echo �� ���� ����
echo 	��ȣ : Telnet ���񽺰� ���� �Ǿ� ���� �ʰų� ���� ����� NTLM ������.
echo 	��� : Telnet ���񽺰� ���� �Ǿ� ������ ���� ����� NTLM�� �ƴ� ������.
echo.
echo.

echo �� ���� ���
net start | find /I "Telnet"
if %errorlevel% EQU 0 (
	echo 	�� ��ȣ ^(SNMP ���񽺸� ������� ����^)
    call %CHK_FILE% SAFE %1
) else (
    reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\TelnetServer\1.0" | find /I "NTLM"
    if %errorlevel% EQU 0 (
	echo 	�� ��� ^(SNMP ���񽺸� �����^)
        echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> cmd -^> tlntadmn config
    echo    Step2^) tlntadmn config sec = +NTLM -passwd 'passwd ���� ����� �����ϰ� NTLM ���� ��ĸ� ���'
    echo    Step3^) ���� -^> ���� -^> SERVICES.MSC -^> Telnet -^> �Ӽ� '�Ϲ�' �ǿ��� "���� ����"�� "��� �� ��"���� ������ �� Telnet ���� ����
    call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(SNMP ���񽺸� ������� ����^)
    call %CHK_FILE% SAFE %1
)
