@echo off
echo ###################################################################################
echo [W23] ���� ���� - IIS WebDAV ��Ȱ��ȭ
echo.

echo �� ���� ����
echo 	��ȣ :  1. IIS ���񽺸� ������� �ʴ� ���
echo			2. DisableWebDAV ���� 1�� �����Ǿ� �ִ� ���
echo			3. Windows NT, 2000�� ������ 4 �̻��� ��ġ�Ǿ� �ִ� ���
echo			4. Windows 2003, Windows 2008�� WebDAV�� ���� �Ǿ� �ִ� ���
echo 	��� :  ��ȣ ���ؿ� �� ������ �ش����� �ʴ� ���(2003, 2008�� 1,4����)
echo.
echo.

echo �� ���� ���
set filePath=C:\Windows\System32\inetsrv\config\applicationHost.config
if exist %filePath% (
    type %filePath% | findstr /C:"\webdav.dll\" allowed=\"true\""
    if errorlevel 1 (
        echo    �� ��ȣ ^(WebDAV�� ��Ȱ��ȭ�Ǿ� �ְų� ������^)
        call %CHK_FILE% SAFE %1
    ) else (
        echo    �� ��� ^(WebDAV�� Ȱ��ȭ��^)
        echo.
        echo.
        echo �� ��ġ ���
        echo    ���ͳ� ���� ����^(IIS^) ������ -^> ���� ���� -^> IIS -^> ISAPI �� CGI ���� ����, WebDAV ��뿩�� Ȯ�� ^(������ ��� ���^)
        call %CHK_FILE% PWN %1
    )

) else (
        echo    �� ��ȣ ^(IIS�� ������� ����^)
        call %CHK_FILE% SAFE 
)

echo.
echo.