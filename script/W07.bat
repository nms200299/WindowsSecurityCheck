@echo off

REM 로컬 정책 파일 경로와 파일명 설정
set "policyFile=C:\Users\T\Desktop\A\111"

REM LSAAnonymousNameLookup 값 확인
for /f "tokens=2 delims==" %%B in ('type "%policyFile%" ^| findstr "LSAAnonymousNameLookup"') do (
    set "LSAAnonymousNameLookup=%%B"
)

REM 공유 권한 및 사용자 그룹 설정 확인
if "%LSAAnonymousNameLookup%" neq "0" (
    echo [공유 권한 및 사용자 그룹 설정]
    echo ■ 결과: 위험
    echo.
    echo Step 1. 시작 - 실행 - fsmgmt.MSC - 로컬 정책 - 공유 - everyone 삭제
    echo Step 2. "네트워크 액세스: 공유 권한 및 사용자 그룹 설정" 정책을 "사용 안 함"으로 설정
    echo.
    pause
) else (
    echo [공유 권한 및 사용자 그룹 설정]
    echo ■ 결과: 안전
    echo.
    pause
)