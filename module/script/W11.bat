@echo off
echo ###################################################################################
echo [W11] ���� ���� - ���丮 ������ ����
echo.

echo �� ���� ����
echo 	��ȣ :  "���丮 �˻�" üũ���� ����.
echo 	��� :  "���丮 �˻�" üũ��.
echo.
echo.

echo �� ���� ���
echo %IIS_PATH%
set "filePath=%IIS_PATH%\web.config"

if exist "%filePath%" (
    type %filePath% | findstr /i /C:"directoryBrowse enabled=\"true\""
    if errorlevel 1 (
        echo    �� ��ȣ ^(���丮 �������� ���ŵ�^)
        call %CHK_FILE% SAFE %1
    ) else (
        echo    �� ��� ^(���丮 �������� �߰ߵ�^)
        echo.
        echo.
        echo �� ��ġ ���
        echo    ������^> ��������^> IIS����^> �ش� �� ����Ʈ^> IIS^> "���丮 �˻�" ���� �� "������" ����
        call %CHK_FILE% PWN %1
    )
)

if not exist "%filePath%" (
    set "filePath2=C:\Windows\System32\inetsrv\config\applicationHost.config"
    if exist "%filePath2%" (
    type %filePath2% | findstr /i /C:"directoryBrowse enabled=\"true\""
        if errorlevel 1 (
            echo    �� ��ȣ ^(���丮 �������� ���ŵ�^)
            call %CHK_FILE% SAFE %1
        ) else (
            echo    �� ��� ^(���丮 �������� �߰ߵ�^)
            echo.
            echo.
            echo �� ��ġ ���
            echo ������^> ��������^> IIS����^> �ش� �� ����Ʈ^> IIS^> "���丮 �˻�" ���� �� "������" ����
            call %CHK_FILE% PWN %1
        )
    )

    if not exist "%filePath2%" (
        echo    �� ��ȣ ^(web.config ������ �������� ����^)
        call %CHK_FILE% SAFE %1 
    )
)


echo.
echo.