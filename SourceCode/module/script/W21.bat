@echo off
echo ###################################################################################
echo [W21] ���� ���� - IIS �̻�� ��ũ��Ʈ ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  ����� ������ �������� ����.
echo 	��� :  ����� ������ ������.
echo.
echo.

echo �� ���� �����
set "configPath=C:\Windows\System32\inetsrv\config\applicationHost.config"
set "filePath=C:\inetpub\wwwroot"
set "subModPath=.\module\script\W21-1.bat"
set "flag=0"
call %subModPath% .htr
call %subModPath% .idc
call %subModPath% .shtm
call %subModPath% .stm
call %subModPath% .printer
call %subModPath% .ida
call %subModPath% .idq
call %subModPath% .htw
rem 1. �� ����� ���� �������� ���� �������� �������� �ִ��� ����
rem 2. �� ���� �������� �߰��� ����� ������ ������ ����
if !flag! EQU 1 (
    echo    �� ��� ^(����� ������ ��ġ���� ����^)
    echo.
    echo.
    echo �� ��ġ ���
    echo    step 1^) ���� -^> ���� -^> INETMGR -^> �� ����Ʈ -^> �ش� ������Ʈ -^> �⺻ ���� -^> ó���� ���� ����
    echo    step 2^) ����� ���� ���� ^(.htr, .idc, .shtm, .shtml, .printer, .htw, .ida, .idq^)
    call %CHK_FILE% PWN %1
) else (
    echo    �� ��ȣ ^(����� ������ �߰ߵ��� �ʾҰų�, ��ġ��^)
    call %CHK_FILE% SAFE %1
)
echo.
echo.