@echo off
echo ###################################################################################
echo [W11] ���� ���� - ���丮 ������ ����
echo.

echo �� ���� ����
echo 	��ȣ :  "���丮 �˻�" üũ���� ����.
echo 	��� :  "���丮 �˻�" üũ��.
echo.
echo.

echo �� ���� �����
type "C:\Windows\System32\inetsrv\config\applicationHost.config" | findstr /i /C:"directoryBrowse enabled=\"true\""

if errorlevel 1 (
    echo    �� ��ȣ ^(���丮 �������� ���ŵ�^)
    call %CHK_FILE% SAFE %1
) else (
    echo    �� ��� ^(���丮 �������� �߰ߵ�^)
    echo �� ��ġ ���
    echo ������^> ��������^> IIS����^> �ش� �� ����Ʈ^> IIS^> "���丮 �˻�" ���� �� "������" ����
    call %CHK_FILE% PWN %1
)
echo.
echo.