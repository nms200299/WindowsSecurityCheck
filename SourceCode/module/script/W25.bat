@echo off

REM FTP 서비스 상태 확인
sc query ftpsvc | find "STATE" > nul

REM 결과 확인
if %errorlevel% equ 0 (
    echo FTP 서비스가 현재 실행 중입니다.
) else (
    echo FTP 서비스가 현재 실행되지 않습니다.
)

pause