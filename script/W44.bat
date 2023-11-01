@echo off
echo W-44 START
echo.
echo [W44] 이동식 미디어 포맷 및 꺼내기 허용
echo.
echo ■ 진단 현황


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /s | find /I "AllocateDASD" |find "0" > nul
if %errorlevel% NEQ 0 (
	echo ■ 결과: 위험
	echo ■ 조치 방안
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 로컬 정채 - 보안 옵션
	echo Step 2. “장치 : 이동식 미디어 포맷 및 꺼내기 허용” 정책을 “Administrators” 로 설정
) else (
    echo ■ 결과: 안전
)

endlocal
