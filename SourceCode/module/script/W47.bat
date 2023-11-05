@echo off

echo W-47 START
echo.
echo [W47] 계정 잠금 기간 설정
echo.
echo ■ 진단 현황

for /f "tokens=3" %%A in ('find /i "LockoutBadCount" LocalSecurityPolicy.txt') do (
    set "LockoutBadCount=%%A"
)


if %LockoutBadCount% equ 0 (
	echo ■ 결과: 위험
	echo ■ 조치 방안 
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 계정 정책 - 계정 잠금 정책
	echo Step 2. "계정 잠금 임계값" 설정후 "계정 잠금 기간" 및 "다음 시간 후 계정 잠금 수를 원래대로 설정" 의 값을 변경 - 60분 이상의 값을 권고
) else (
	echo ■ 결과: 안전
)

