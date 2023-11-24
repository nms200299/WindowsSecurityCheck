@echo off
echo ###################################################################################
echo [W46] 계정 관리 - Everyone 사용권한을 익명 사용자에 적용 해제
echo.

echo ■ 진단 기준
echo 	양호 : “Everyone 사용 권한을 익명 사용자에게 적용” 정책이 “사용 안 함” 으로 되어 있는 경우
echo 	취약 : “Everyone 사용 권한을 익명 사용자에게 적용” 정책이 “사용” 으로 되어 있는 경우
echo.
echo.

echo ■ 진단 결과
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | find /I "everyoneincludesanonymous" | find "0x0" > nul
if %errorlevel% NEQ 0 (
	echo 	→ 취약 ^(취약 : “Everyone 사용 권한을 익명 사용자에게 적용” 정책이 “사용” 으로 되어 있는 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
	echo 	Step2^) "Everyone 사용 권한을 익명 사용자에게 적용" 정책이 "사용 안 함"으로 설정
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(“Everyone 사용 권한을 익명 사용자에게 적용” 정책이 “사용 안 함” 으로 되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.