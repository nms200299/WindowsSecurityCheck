@echo off

REM IIS 가상 디렉토리 이름 설정
set "virtualDirectoryName=YourVirtualDirectory"

REM IIS 관리 도구를 호출하여 가상 디렉토리 삭제
appcmd delete vdir /vdir.name:"%virtualDirectoryName%"

REM 삭제 결과 메시지 출력
if %errorlevel% equ 0 (
    echo 가상 디렉토리 "%virtualDirectoryName%"이(가) 성공적으로 삭제되었습니다.
) else (
    echo 가상 디렉토리 "%virtualDirectoryName%" 삭제 중 오류가 발생했습니다.
)

pause