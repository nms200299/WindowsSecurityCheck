@echo off

REM 데이터 파일 또는 디렉토리 경로 설정
set "dataPath=C:\Path\To\Your\Data"

REM ACL 권한 설정
icacls "%dataPath%" /grant "IIS_IUSRS:(OI)(CI)M"

REM 설정 결과 메시지 출력
if %errorlevel% equ 0 (
    echo ACL 권한 설정이 성공적으로 완료되었습니다.
) else (
    echo ACL 권한 설정 중 오류가 발생했습니다.
)

pause