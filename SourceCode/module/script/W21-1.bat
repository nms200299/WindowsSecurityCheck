@echo off
for /F "tokens=1-3 delims= " %%a in ('type %configPath% ^| findstr /C:"%1"') do (
    echo %%b
    echo %%c
    echo = ����� ���� ���� ���� �߰�
    set mapName=%%b
    set "mapName=!mapName:"=\"!"
    type %filePath%\web.config | findstr /C:"remove !mapName!"
    if errorlevel 1 (
        set "flag=1"
        echo = ����� ������ ���� �������� �������� ����.
    ) else (
        echo = ����� ������ ���� �������� ������.
    )
    echo.
)

if exist %filePath%\web.config (
    type %filePath%\web.config | findstr /C:"%1"
    if not errorlevel 1 (
        set "flag=1"
        echo = ����� ���� ���� ���� �߰�
        echo.
    )
)