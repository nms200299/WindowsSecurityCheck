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

echo �� ���� �����
set "webDavModuleStatus="
for /f "tokens=3*" %%i in ('%SystemRoot%\System32\inetsrv\appcmd.exe list module ^| find "WebDAVModule"') do set "webDavModuleStatus=%%j"

if not "!webDavModuleStatus!"=="" (
    echo WebDAV ����� Ȱ��ȭ�Ǿ� �ֽ��ϴ�.

    echo ��� �����Դϴ�. ��ġ�� �ʿ�

echo �� ��ġ ���
    echo 1. IIS �����ڸ� ����, �� ����Ʈ �Ǵ� ���� ���͸��� ����
    echo 2. "���"�� ���� Ŭ���ϰ�, "WebDAV ���"�� �����Ͽ� ��Ȱ��ȭ
    echo 3. ���� ������Ʈ�� ����

) else (
    echo WebDAV ����� ��Ȱ��ȭ�Ǿ� ��dma.
    echo �ý����� ������ ����
)
echo.
echo.
pause