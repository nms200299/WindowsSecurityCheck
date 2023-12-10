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
if errorlevel 1 (
	echo 	�� ��ȣ ^(Telnet ���񽺸� ������� ����^)
    call %CHK_FILE% SAFE %1
) else (
    reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\TelnetServer\1.0" /v "SecurityMechanism" | findstr /C:"0x2"

    if not errorlevel 1 (
        echo    �� ��ȣ ^(���� ����� NTLM�� ����ϰ� ����^)
        call %CHK_FILE% SAFE %1
    ) else (
        echo    �� ��� ^(���� ����� NTLM�� �ƴϰų�, NTLM�� ����ϰ� ���� ����^)
        echo.
        echo.
        echo �� ��ġ ���
        echo    Step1^) ���� -^> ���� -^> cmd -^> tlntadmn config
        echo    Step2^) tlntadmn config sec = +NTLM -passwd 'passwd ���� ����� �����ϰ� NTLM ���� ��ĸ� ���'
        echo    Step3^) ���� -^> ���� -^> SERVICES.MSC -^> Telnet -^> �Ӽ� '�Ϲ�' �ǿ��� "���� ����"�� "��� �� ��"���� ������ �� Telnet ���� ����
        call %CHK_FILE% PWN %1
    )
)
echo.
echo.