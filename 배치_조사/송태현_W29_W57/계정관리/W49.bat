@echo off

echo W-49 START
echo.
echo [W49] 패스워드 최소 암호 길이
echo.
echo ■ 진단 현황

for /f "tokens=3" %%A in ('find /i "MinimumPasswordLength" LocalSecurityPolicy.txt') do (
    set "MinimumPasswordLength=%%A"
)

if %MinimumPasswordLength% equ 0 (
	echo ■ 결과: 위험
	echo ■ 조치 방안 
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 계정 정책 - 암호정책
	echo Step 2.  "최소 암호 길이"를 "8문자"이상으로 설정
) else (
	echo ■ 결과: 안전
)