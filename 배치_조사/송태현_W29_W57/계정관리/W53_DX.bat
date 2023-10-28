@echo off
setlocal enabledelayedexpansion

echo W-53 START
echo.
echo [W53] 로컬 로그온 허용
echo.
echo ■ 진단 현황

for /f "tokens=3" %%A in ('find /i "SeInteractiveLogonRight" LocalSecurityPolicy.txt') do (
    set "SeInteractiveLogonRight=%%A"
)

echo %SeInteractiveLogonRight%

echo %SeInteractiveLogonRight% | findstr /C:"*S-1-5-32-544" /C:"*S-1-5-32-568" >nul
if %errorlevel% equ 1 (
    echo ■ 결과: 위험
	echo ■ 조치 방안
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 사용자 권한 할당
    echo Step 2. "로컬 로그온 허용(또는, 로컬 로그온)" 정책에 "Adminstrators", "IUSR_" 외 다른 계정 및 그룹 제거
	
) else (
    echo ■ 결과: 안전
)

endlocal