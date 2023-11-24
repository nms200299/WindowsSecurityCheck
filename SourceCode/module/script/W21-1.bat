@echo off
for /F "tokens=1-3 delims= " %%a in ('type %configPath% ^| findstr /C:"%1"') do (
    echo %%b
    echo %%c
    echo = 취약한 매핑 전역 설정 발견
    set mapName=%%b
    set "mapName=!mapName:"=\"!"
    type %filePath%\web.config | findstr /C:"remove !mapName!"
    if errorlevel 1 (
        set "flag=1"
        echo = 취약한 매핑이 지역 설정에서 지워지지 않음.
    ) else (
        echo = 취약한 매핑이 지역 설정에서 지워짐.
    )
    echo.
)

if exist %filePath%\web.config (
    type %filePath%\web.config | findstr /C:"%1"
    if not errorlevel 1 (
        set "flag=1"
        echo = 취약한 매핑 지역 설정 발견
        echo.
    )
)