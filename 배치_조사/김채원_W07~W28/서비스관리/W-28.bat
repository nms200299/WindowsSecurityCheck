@echo off
echo ###################################################################################
echo [W28] ���� ���� - FTP ���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  Ư�� IP �ּҿ����� FTP ������ �����ϵ��� �������� ������ ������ ���
echo 	��� :  Ư�� IP �ּҿ����� FTP ������ �����ϵ��� �������� ������ �������� ���� ���
echo.
echo.

echo �� ���� �����
REM FTP ���� ���� ���� ��� ����
set "ftpConfigFile=C:\Path\To\Your\FTP\Server\ftp.conf"

REM ���� ���� ������ Ȯ���մϴ�.
set "accessControlEnabled="
findstr /C:"AccessControl_enable=YES" "!ftpConfigFile!" >nul 2>&1
if %errorlevel% equ 0 (
    set "accessControlEnabled=YES"
) else (
    set "accessControlEnabled=NO"
)

if "!accessControlEnabled!"=="YES" (
    echo FTP ���� ��� ��Ȱ��ȭ

    echo ��� ����/ ��ġ�� �ʿ�

	echo �� ��ġ ���
    echo ������> ��������> IIS ����> �ش� ������Ʈ> FTP IPv4 �ּ� �� ������ ����

) else (
    echo FTP ���� ��� Ȱ��ȭ
    echo ��ȣ
)
echo.
echo.
pause