@echo off

REM IIS FTP ����Ʈ �̸� ����
set "siteName=YourFTPSiteName"

REM ���� ���� ���� (��: Ư�� IP �뿪 ���)
%SystemRoot%\System32\inetsrv\appcmd set config -section:system.ftpServer/security/ipSecurity /+"[ipAddress='192.168.1.0',subnetMask='255.255.255.0',allowed='True']" /commit:apphost

REM ���� ��� �޽��� ���
if %errorlevel% equ 0 (
    echo FTP ���� ��� �����Ǿ����ϴ�.
) else (
    echo FTP ���� ���� ���� �� ������ �߻��߽��ϴ�.
)

pause