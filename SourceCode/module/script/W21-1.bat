@echo off
for /F "tokens=1-3 delims= " %%a in ('type %configPath% ^| findstr /C:"%1"') do (
    set mapName=%%b
    set "mapName=!mapName:"=\"!"
    echo !mapName! | findstr /C:"name="
    if not errorlevel 1 (
        echo %%b
        echo %%c
        echo = 취약한 매핑 전역 설정 발견.

        type %filePath%\web.config | findstr /C:"remove !mapName!"
        if errorlevel 1 (
            set "flag=1"
            echo = 취약한 매핑이 지역 설정에서 지워지지 않음.
        ) else (
            echo = 취약한 매핑이 지역 설정에서 지워짐.
        )
        echo.
    )
    rem W21, W18에서 매핑 비교에 사용

    echo %%b | findstr /C:"fileExtension=\"%1"
    if not errorlevel 1 (
        echo %%c | findstr /C:"allowed=\"false\""
        if not errorlevel 1 (
            echo = 양호한 요청 필터링 전역 설정 발견.
            set "flag1=0"
        ) else (
            echo = 취약한 요청 필터링 전역 설정 발견.
            set "flag1=1"
        )
    )
    rem W18에서 요청 필터링 비교에 사용

)

if exist %filePath%\web.config (
    type %filePath%\web.config | findstr /C:"%1" | findstr /C:"add name"
    if not errorlevel 1 (
        echo = 취약한 매핑 지역 설정 발견.
        echo.
        set "flag=1"
    )
    type %filePath%\web.config | findstr /C:"%1" | findstr /C:"add fileExtension"
    if not errorlevel 1 (
        type %filePath%\web.config | findstr /C:"%1" | findstr /C:"add fileExtension" | findstr /C:"allowed=\"false"
        if errorlevel 1 (
            echo = 취약한 요청 필터링 지역 설정 발견.
            set "flag1=1"
            
        )
        type %filePath%\web.config | findstr /C:"%1" | findstr /C:"add fileExtension" | findstr /C:"allowed=\"true"
        if errorlevel 1 (
            echo = 양호한 요청 필터링 지역 설정 발견.
            set "flag1=0"
        )
    ) else (
        echo = 요청 필터링 지역 설정이 존재하지 않음.

    )
)