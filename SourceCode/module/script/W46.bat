@echo off
echo W-46 START
echo.
echo [W46] Everyone 사용권한을 익명 사용자에 적용 해제
echo.
echo ■ 진단 현황


reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | find /I "everyoneincludesanonymous" | find "0x0" > nul
if %errorlevel% NEQ 0 (
    echo ■ 결과: 위험
    echo ■ 조치 방안
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
    echo Step 2. "Everyone 사용 권한을 익명 사용자에게 적용" 정책이 "사용 안 함"으로 설정
) else (
    echo ■ 결과: 안전
)
