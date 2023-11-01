@echo off

echo W-48 START
echo.
echo [W48] 패스워드 복잡성 설정
echo.
echo ■ 진단 현황

for /f "tokens=3" %%A in ('find /i "PasswordComplexity" LocalSecurityPolicy.txt') do (
    set "PasswordComplexity=%%A"
)


if %PasswordComplexity% equ 0 (
	echo ■ 결과: 위험
	echo ■ 조치 방안 
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 계정 정책 - 암호정책
	echo Step 2.  "암호는 복잡성을 만족해야 함"을 "사용"으로 설정
) else (
	echo ■ 결과: 안전
)