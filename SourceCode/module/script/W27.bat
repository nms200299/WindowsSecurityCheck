@echo off
echo ###################################################################################
echo [W27] ���� ���� - Anonymous FTP ����
echo.

echo �� ���� ����
echo 	��ȣ :  FTP ���񽺸� ������� �ʰų�, "�͸� ���� ���"�� üũ���� ���� ���
echo 	��� :  FTP ���񽺸� ����ϰų�, "�͸� ���� ���"�� üũ�Ǿ� �ִ� ���
echo.
echo.

echo �� ���� ���
net start | find /i "Microsoft FTP Service"
if errorlevel 1 (
    echo    �� ��ȣ ^(FTP ���񽺰� ���� ������ ����^)
    call %CHK_FILE% SAFE %1
) else (
    type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /C:"<anonymousAuthentication enabled=\"true\" />"
    if errorlevel 1 (
        echo    �� ��ȣ ^(FTP �͸� ���� �����^)
        call %CHK_FILE% SAFE %1
    ) else (
        echo    �� ��� ^(FTP �͸� ���� ���^)
        echo.
        echo.
        echo �� ��ġ ���
        echo    Step 1^) ������ -^> �������� -^> ���ͳ� ���� ���� ^(IIS^) ���� -^> �ش� �� ����Ʈ -^> ���콺 ��Ŭ�� -^> FTP �Խ� �߰�
        echo    Step 2^) ���� ���� �������� ���� ȭ���� �͸� üũ �ڽ� ����
        call %CHK_FILE% PWN %1
    )
)
echo.
echo.