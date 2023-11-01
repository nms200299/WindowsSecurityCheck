@echo off

REM FTP 디렉터리 경로 설정
set "ftpDirectory=C:\Path\To\Your\FTP\Directory"

REM FTP 디렉터리에 대한 접근 권한 설정
icacls "%ftpDirectory%" /grant "FTP Users:(OI)(CI)RX" /grant "Administrator:(OI)(CI)F"

REM 설정 결과 메시지 출력
if %errorlevel% equ 0 (
    echo FTP 디렉터리에 대한 접근 권한이 성공적으로 설정되었습니다.
) else (
    echo FTP 디렉터리에 대한 접근 권한 설정 중 오류가 발생했습니다.
)

pause