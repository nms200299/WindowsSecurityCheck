@echo off
echo W-43 START
echo.
echo [W43] Autologon 기능 제어
echo.
echo ■ 진단 현황


reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Winlogon" /s | find /I "AutoAdminLogon"  > nul
if %errorlevel% EQU 0 (
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Winlogon" /s | find /I "AutoAdminLogon" | find "1"  > nul
	if %errorlevel% EQU 0 (
		echo ■ 결과: 위험
		echo ■ 조치 방안
		echo Step 1. 시작 - 실행 - SECPOL.MSC - 로컬 정채 - 보안 옵션
    	echo Step 2. "SAM 계정과 공유의 익명 열거 허용 안함"을 " 사용" 으로 설정
	) else (
		echo ■ 결과: 안전
	)

) else (
    echo ■ 결과: 안전
)

endlocal
