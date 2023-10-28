@echo off
echo W-41 START
echo.
echo [W41] 보안감사를 로그할 수 없는 경우 즉시 시스템 종료 해제
echo.
echo ■ 진단 현황


reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | find /I "crashonauditfail" | find "0x0" > nul
if %errorlevel% NEQ 0 (
    echo ■ 결과: 위험
    echo ■ 조치 방안
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
    echo Step 2. "보안감사를 로그할 수 없는 경우 즉시 시스템 종료"을 " 사용 안 함" 으로 설정
) else (
    echo ■ 결과: 안전
)
