@echo off
echo ###################################################################################
echo [W27] ���� ���� - Anonymous FTP ����
echo.

echo �� ���� ����
echo 	��ȣ :  FTP ���񽺸� ������� �ʰų�, "�͸� ���� ���"�� üũ���� ���� ���
echo 	��� :  FTP ���񽺸� ����ϰų�, "�͸� ���� ���"�� üũ�Ǿ� �ִ� ���
echo.
echo.

echo �� ���� �����
REM FTP ���� ���� ���� ��� ����
set "ftpConfigFile=C:\Path\To\Your\FTP\Server\ftp.conf"

REM Anonymous FTP ������ Ȯ���մϴ�.
set "anonymousFtpEnabled="
findstr /C:"Anonymous_enable=YES" "!ftpConfigFile!" >nul 2>&1
if %errorlevel% equ 0 (
    set "anonymousFtpEnabled=YES"
) else (
    set "anonymousFtpEnabled=NO"
)

if "!anonymousFtpEnabled!"=="YES" (
    echo Anonymous FTP�� Ȱ��ȭ

    REM ��� ���·� �Ǵ��ϰ� ��ġ ����� �ȳ�
    echo ��� ����

 echo �� ��ġ ���
    echo 1. FTP ���� ���� ������ ����, Anonymous FTP�� ��Ȱ��ȭ
    echo 2. �ʿ信 ���� ���� ������Ʈ�� �����մϴ�.

) else (
    echo Anonymous FTP�� ��Ȱ��ȭ
    echo  ��ȣ
)
echo.
echo.
pause