@echo off
for /F "tokens=1-3 delims= " %%a in ('type %configPath% ^| findstr /C:"%1"') do (
    set mapName=%%b
    set "mapName=!mapName:"=\"!"
    echo !mapName! | findstr /C:"name="
    if not errorlevel 1 (
        echo %%b
        echo %%c
        echo = ����� ���� ���� ���� �߰�.

        type %filePath%\web.config | findstr /C:"remove !mapName!"
        if errorlevel 1 (
            set "flag=1"
            echo = ����� ������ ���� �������� �������� ����.
        ) else (
            echo = ����� ������ ���� �������� ������.
        )
        echo.
    )
    rem W21, W18���� ���� �񱳿� ���

    echo %%b | findstr /C:"fileExtension=\"%1"
    if not errorlevel 1 (
        echo %%c | findstr /C:"allowed=\"false\""
        if not errorlevel 1 (
            echo = ��ȣ�� ��û ���͸� ���� ���� �߰�.
            set "flag1=0"
        ) else (
            echo = ����� ��û ���͸� ���� ���� �߰�.
            set "flag1=1"
        )
    )
    rem W18���� ��û ���͸� �񱳿� ���

)

if exist %filePath%\web.config (
    type %filePath%\web.config | findstr /C:"%1" | findstr /C:"add name"
    if not errorlevel 1 (
        echo = ����� ���� ���� ���� �߰�.
        echo.
        set "flag=1"
    )
    type %filePath%\web.config | findstr /C:"%1" | findstr /C:"add fileExtension"
    if not errorlevel 1 (
        type %filePath%\web.config | findstr /C:"%1" | findstr /C:"add fileExtension" | findstr /C:"allowed=\"false"
        if errorlevel 1 (
            echo = ����� ��û ���͸� ���� ���� �߰�.
            set "flag1=1"
            
        )
        type %filePath%\web.config | findstr /C:"%1" | findstr /C:"add fileExtension" | findstr /C:"allowed=\"true"
        if errorlevel 1 (
            echo = ��ȣ�� ��û ���͸� ���� ���� �߰�.
            set "flag1=0"
        )
    ) else (
        echo = ��û ���͸� ���� ������ �������� ����.

    )
)