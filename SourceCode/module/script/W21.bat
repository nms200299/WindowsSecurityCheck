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
set "flag=0"
call ./W21-1.bat .htr
call ./W21-1.bat .idc
call ./W21-1.bat .shtm
call ./W21-1.bat .stm
call ./W21-1.bat .printer
call ./W21-1.bat .ida
call ./W21-1.bat .idq
call ./W21-1.bat .htw
rem 1. �� ����� ���� �������� ���� �������� �������� �ִ��� ����
rem 2. �� ���� �������� �߰��� ����� ������ ������ ����
if !flag! EQU 1 (
    echo    �� ��� ^(����� ������ ��ġ���� ����^)
    echo.
    echo.
  echo �� ��ġ ���
  echo    step 1^) ���� -^> ���� -^> INETMGR -^> �� ����Ʈ -^> �ش� ������Ʈ -^> �⺻ ���� -^> ó���� ���� ����
  echo    step 2^) ����� ���� ���� ^(.htr, .idc, .shtm, .shtml, .printer, .htw, .ida, .idq^)
) else (
    echo    �� ��� ^(����� ������ �߰ߵ��� �ʾҰų�, ��ġ��^)
)
echo.
echo.