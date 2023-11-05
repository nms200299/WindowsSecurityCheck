@echo off

REM WebDAV 모듈 비활성화
dism /online /disable-feature /featurename:IIS-WebDAV

REM 설정 결과 메시지 출력
if %errorlevel% equ 0 (
    echo WebDAV 모듈이 성공적으로 비활성화되었습니다.
) else (
    echo WebDAV 모듈 비활성화 중 오류가 발생했습니다.
)

pause