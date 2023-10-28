@echo off

echo W-56 START
echo.
echo [W56] 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한
echo.
echo ■ 진단 현황

reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Lsa" /s | find /I "LimitBlankPasswordUse" | find "0x1" > nul
if %errorlevel% NEQ 0 (
    echo ■ 결과: 위험
    echo ■ 조치 방안
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
    echo Step 2. "계정: 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한" 정책을 "사용"으로 설정
) else (
    echo ■ 결과: 안전
)
