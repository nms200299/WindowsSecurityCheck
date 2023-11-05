@echo off

echo W-30 START
echo.
echo [W30]RDS(Remonte Data Services) 제거
echo.
echo ■ 진단 현황

reg query "HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\여기 부터 없음" /s | find /I "SecureSecondaries" | find "0" > nul
if %errorlevel% NEQ 0 (
    echo ■ 결과: 안전
) else (
    echo ■ 결과: 위험
    echo ■ 조치 방안
		echo Step 1. 시작 - 실행 - DNSMGNT.MSC - 각 조회 영역 - 해당 영역 - 속성 - 영역 전송
		echo Step 2. "다음 서버로만" 선택 후 전송할 서버 IP 추가
)