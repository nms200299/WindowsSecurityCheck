@echo off

REM NetBIOS 바인딩 서비스 상태 확인
sc query NetBT | find "STATE" > nul

REM 결과 확인
if %errorlevel% equ 0 (
    echo NetBIOS 바인딩 서비스가 현재 실행 중입니다.
) else (
    echo NetBIOS 바인딩 서비스가 현재 실행되지 않습니다.
)

pause