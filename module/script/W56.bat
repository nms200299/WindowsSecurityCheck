@echo off
echo ###################################################################################
echo [W56] 계정 관리 - 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한
echo.

echo ■ 진단 기준
echo 	양호 : “콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한” 정책이 “사용”인 경우
echo 	취약 : “콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한” 정책이 “사용 안 함”인 경우
echo.
echo.

echo ■ 진단 결과
reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Lsa" /s | find /I "LimitBlankPasswordUse" | find "0x1" > nul
if %errorlevel% NEQ 0 (
	echo 	→ 취약 ^(“콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한” 정책이 “사용 안 함”인 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
	echo 	Step2^) "계정: 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한" 정책을 "사용"으로 설정
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(“콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한” 정책이 “사용”인 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.