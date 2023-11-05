@echo off

echo W-55 START
echo.
echo [W55] 최근 암호 기억
echo.
echo ■ 진단 현황

for /f "tokens=3" %%A in ('find /i "LSAAnonymousNameLookup" LocalSecurityPolicy.txt') do (
    set "LSAAnonymousNameLookup=%%A"
)


if %LSAAnonymousNameLookup% neq 0 (
	echo ■ 결과: 위험
	echo ■ 조치 방안 
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
	echo Step 2.   "네트워크 액세스: 익명 SID/이름 변환 허용" 정책이 "사용 안 함"으로 설정
) else (
	echo ■ 결과: 안전
)