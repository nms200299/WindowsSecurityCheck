@echo off
echo W-39 START
echo.
echo [W39] 로그온 하지 않고 시스템 종료 허용 해제
echo.
echo ■ 진단 현황


reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" /s | find /I "shutdownwithoutlogon" | find "0x0" > nul
if %errorlevel% NEQ 0 (
    echo ■ 결과: 위험
    echo ■ 조치 방안
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 로컬 정채 - 보안 옵션
    echo Step 2. "시스템 종료 : 로그온 하지 않고 시스템 종료 허용"을 " 사용 안 함" 으로 설정
) else (
    echo ■ 결과: 안전
)

endlocal
