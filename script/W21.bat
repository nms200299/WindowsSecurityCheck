@echo off

REM IIS 사이트 이름 설정
set "siteName=YourSiteName"

REM 미사용 스크립트 매핑 제거
appcmd set config "%siteName%" -section:handlers /-[name='YourHandlerName']

REM 제거 결과 메시지 출력
if %errorlevel% equ 0 (
    echo 미사용 스크립트 매핑이 성공적으로 제거되었습니다.
) else (
    echo 미사용 스크립트 매핑 제거 중 오류가 발생했습니다.
)

pause