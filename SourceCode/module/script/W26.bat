echo ###################################################################################
echo [W25] ���� ���� - FTP ���丮 ���ٱ��� ����
echo.

echo �� ���� ����
echo 	��ȣ :  FTP Ȩ ���丮�� Everyone ������ ����.
echo 	��� :  FTP Ȩ ���丮�� Everyone ������ ����.
echo.
echo.

echo �� ���� ���
set "filePath=%FTP_PATH%"
set "flag=0"


icacls %filePath% | findstr /i "Everyone"
if not errorlevel 1 (
    set "flag=1"
)
rem FTP Ȩ ���͸��� OS ACL ��å�� Everyone ������ �ִ� ���

type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /I /C:"<add accessType=\"Allow\" users=\"*\""
if not errorlevel 1 (
    set "flag=1"
)
rem FTP ��å�� ��� ����� ��� ������ �ִ� ���


if !flag! EQU 0 (
    echo    �� ��ȣ ^(FTP Ȩ ���丮�� Everyone ������ ����^)
    call %CHK_FILE% SAFE %1
) else (
    echo    �� ��� ^(FTP Ȩ ���丮�� Everyone ������ ����^)
    echo.
    echo.
    echo �� ��ġ ���
    echo    Step 1^) ������ -^> �������� -^> ���ͳ� ���� ���� ^(IIS^) ���� -^> �ش� �� ����Ʈ -^> ���콺 ��Ŭ�� -^> FTP �Խ� �߰�
    echo    Step 2^) ���� ���� �������� ���� �ο� ȭ���� ������ ��� ��� ������ ^[������ �����^]�� ����
    echo    Step 3^) FTP Ȩ ���丮�� Everyone ���� ����
    call %CHK_FILE% PWN %1
)
echo.
echo.