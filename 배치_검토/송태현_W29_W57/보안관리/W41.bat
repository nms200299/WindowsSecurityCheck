@echo off
echo ###################################################################################
echo [W41] 보안 관리 - 보안감사를 로그할 수 없는 경우 즉시 시스템 종료 해제
echo.

echo ■ 진단 기준
echo 	양호 : “보안 감사를 로그할 수 없는 경우 즉시 시스템 종료” 정책이 “사용 안 함”으로 되어 있는 경우
echo 	취약 : : “보안 감사를 로그할 수 없는 경우 즉시 시스템 종료” 정책이 “사용”으로 되어 있는 경우
echo.
echo.

echo ■ 진단 결과
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | find /I "crashonauditfail" | find "0x0" > nul
if %errorlevel% NEQ 0 (
	echo 	→ 취약 ^(“보안 감사를 로그할 수 없는 경우 즉시 시스템 종료” 정책이 “사용”으로 되어 있는 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정채 -^> 보안 옵션
	echo 	Step2^) "보안감사를 로그할 수 없는 경우 즉시 시스템 종료"을 " 사용 안 함" 으로 설정
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(“보안 감사를 로그할 수 없는 경우 즉시 시스템 종료” 정책이 “사용 안 함”으로 되어 있는 경우음^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.