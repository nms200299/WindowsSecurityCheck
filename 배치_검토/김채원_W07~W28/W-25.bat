@echo off
echo ###################################################################################
echo [W25] ���� ���� - FTP ���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  FTP ���񽺸� ������� �ʴ� ��� �Ǵ� secure FTP ���񽺸� ����ϴ� ���
echo 	��� :  FTP ���񽺸� ����ϴ� ���
echo.
echo.

echo �� ���� �����

set "ftpServiceStatus="
for /f "tokens=3*" %%i in ('sc query FTPSVC ^| find "STATE"') do set "ftpServiceStatus=%%j"

if not "!ftpServiceStatus!"=="" (
    echo FTP ���񽺰� ���� ���� ��

    echo ��� 

echo �� ��ġ ���(
  echo ����> ����> services.msc> FTP Publishing Service> �Ӽ�> [�Ϲ�]�ǿ��� "��������"�� "������"���� ���� ��, FTP ���� ����
) else (
    echo FTP ���񽺰� ���� ��Ȱ��ȭ
    echo �ý����� ��ȣ
)
echo.
echo.
pause