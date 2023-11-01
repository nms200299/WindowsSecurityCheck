@echo off

echo W-51 START
echo.
echo [W51] 패스워드 최소 사용 기간
echo.
echo ■ 진단 현황

for /f "tokens=3" %%A in ('find /i "MinimumPasswordAge" LocalSecurityPolicy.txt') do (
    set "MinimumPasswordAge=%%A"
)


if %MinimumPasswordAge% equ 0 (
	echo ■ 결과: 위험
	echo ■ 조치 방안 
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 계정 정책 - 암호정책
	echo Step 2.  "최소 암호 사용 기간"에서 "사용 기간"을 "1일"로 설정
) else (
	echo ■ 결과: 안전
)