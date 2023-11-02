@echo off
setlocal

echo W-35 START
echo.
echo [W35] 원격으로 액세스 할 수 있는 레지스트리 경로
echo.
echo ■ 진단 현황

net start | find /I "Remote Registry" > nul
if %errorlevel% EQU 0 (
    echo ■ 결과: 위험
    echo ■ 조치 방안
    echo Step 1. 시작 - 실행 - SERVICES.MSC - Remote Registry - 속성
    echo Step 2. 시작 유형 - 사용 안함
    echo Step 3. 서비스 상태 - 중지
) else (
    echo ■ 결과: 안전
)

endlocal
