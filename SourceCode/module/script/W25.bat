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
net start | find /i "Microsoft FTP Service"
if errorlevel 1 (
    echo    �� ��ȣ ^(FTP ���񽺰� ���� ������ ����^)
    call %CHK_FILE% SAFE %1
) else (
    echo    �� ��� ^(FTP ���񽺰� ���� ����^)
    echo.
    echo.
    echo �� ��ġ ���
    echo    ���� -^> ���� -^> SERVICES.MSC -^> FTP Publishing Service �Ǵ� Microsoft FTP Service ����
    echo    �Ӽ� -^> ^[�Ϲ�^] �ǿ��� "���� ����"�� "��� �� ��"���� ������ ��, FTP ���� ���� 
    call %CHK_FILE% PWN %1
)
echo.
echo.