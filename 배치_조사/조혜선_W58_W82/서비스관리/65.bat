@echo off

echo. W-65 Telnet ���� ����
echo.
echo [ W-65 "Telnet ���� ����" ]
echo.
net start | find /I "Telnet"
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\TelnetServer\1.0" | find /I "NTLM"
    if not errorlevel 1 (
        echo �� ���: ��ȣ
    ) else (
        echo �� ���: ���
        echo �� ��ġ ���
        echo Step 1 ���� - ���� - cmd - tlntadmn config
        echo Step 2 tlntadmn config sec = +NTLM -passwd "passwd ���� ����� �����ϰ� NTLM ���� ��ĸ� ���"
        echo Step 3 ���ʿ� �� �ش� ���� ����
        echo ����- ���� - SERVICES.MSC - Telnet - �Ӽ� [�Ϲ�] �ǿ��� "���� ����"�� "��� �� ��"���� ������ �� Telnet ���� ����
    )

)