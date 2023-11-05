@echo off

echo W-50 START
echo.
echo [W50] 패스워드 최대 사용 기간
echo.
echo ■ 진단 현황

for /f "tokens=3" %%A in ('find /i "MaximumPasswordAge" LocalSecurityPolicy.txt') do (
    set "MaximumPasswordAge=%%A"
)


if %MaximumPasswordAge% LSS 90 (
	echo ■ 결과: 위험
	echo ■ 조치 방안 
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 계정 정책 - 암호정책
	echo Step 2.  "최대 암호 사용 기간"의 "사용 기간"을 "90일"로 설정
) else (
	echo ■ 결과: 안전
)