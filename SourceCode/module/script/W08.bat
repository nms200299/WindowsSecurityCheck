@echo off

echo [하드 디스크 기본 공유 제거]
echo.

REM 하드 디스크 기본 공유 확인
for /f "tokens=2 delims==" %%C in ('wmic logicaldisk where "drivetype=3" get name^, sharename /format:list ^| findstr /i "name sharename"') do (
    set "driveName=%%C"
    set "shareName=%%D"
    
    REM 기본 공유 제거
    if not "%shareName%"=="" (
        net share "%shareName%" /delete
        echo %driveName% - %shareName% 기본 공유가 제거되었습니다.
    )
)

echo.
echo [작업 완료]
echo.

pause