@echo off
echo ###################################################################################
echo [W28] ���� ���� - FTP ���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  Ư�� IP �ּҿ����� FTP ������ �����ϵ��� �������� ������ ������
echo 	��� :  Ư�� IP �ּҿ����� FTP ������ �����ϵ��� �������� ������ �������� ����
echo.
echo.

echo �� ���� �����
type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /I /C:"binding protocol=\"ftp\""
if not errorlevel 1 (
    rem FTP ���񽺰� ���ε� �� ���,
    type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /I /C:"<ipSecurity allowUnlisted=\"false"
    if errorlevel 1 (
        echo    �� ��� ^(������ IP�� FTP ������ �����ϵ��� �������� ����^)
        echo      ^(������ IP�� �ִ���, �������� ���� Ŭ���̾�Ʈ�� ���� ������ �źΰ� �������� ������ ��� -^> step3 ����^)
        echo.
        echo.
        echo �� ��ġ ���
        echo step 1^) ������ -^> �������� -^> ���ͳ� ���� ���� ^(IIS^) ���� -^> �ش� �� ����Ʈ -^> FTP IPv4 �ּ� �� ������ ����
        echo step 2^) ^[�۾�^]�� ��� �׸� �߰����� FTP ������ ����� IP �Է�
        echo step 3^) ^[�۾�^]�� ��� ���� �������� �������� ���� Ŭ���̾�Ʈ�� ���� �������� �ź� ����
        call %CHK_FILE% PWN %1
    ) else (
        echo    �� ��ȣ ^(Ư�� IP�� FTP ������ �����ϵ��� ������^)
        call %CHK_FILE% SAFE %1
    )
) else (
    echo    �� ��ȣ ^(FTP ���񽺰� ���ε� ���� ����^)
    call %CHK_FILE% SAFE %1
)

echo.
echo.