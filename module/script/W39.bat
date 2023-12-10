@echo off
echo ###################################################################################
echo [W39] 보안 관리 - 로그온 하지 않고 시스템 종료 허용 해제
echo.

echo ■ 진단 기준
echo 	양호 :  “로그온 하지 않고 시스템 종료 허용”이 “사용 안 함”으로 설정되어 있는 경우
echo 	취약 :  “로그온 하지 않고 시스템 종료 허용”이 “사용”으로 설정되어 있는 경우
echo.          
echo.

echo ■ 진단 결과　
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" /s | find /I "shutdownwithoutlogon" | find "0x0" > nul
if %errorlevel% NEQ 0 (
    echo 	→ 취약 ^(“로그온 하지 않고 시스템 종료 허용”이 “사용 안 함”으로 설정되어 있는 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
    echo 	Step2^) "시스템 종료 : 로그온 하지 않고 시스템 종료 허용"을 " 사용 안 함" 으로 설정
	call %CHK_FILE% PWN %1
) else (
    echo 	→ 양호 ^(“로그온 하지 않고 시스템 종료 허용”이 “사용”으로 설정되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)

echo.
echo.