@echo off
echo ###################################################################################
echo [W52] 계정 관리 - 마지막 사용자 이름 표시 안함
echo.

echo ■ 진단 기준
echo 	양호 : “마지막 사용자 이름 표시 안 함”이 “사용”으로 설정되어 있는 경우
echo 	취약 : “마지막 사용자 이름 표시 안 함”이 “사용 안 함”으로 설정되어 있는 경우
echo.
echo.

echo ■ 진단 결과
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" /v "DontDisplayLastUserName" | findstr /C:"0x1" > nul
if errorlevel 1 (
	echo 	→ 취약 ^(“마지막 사용자 이름 표시 안 함”이 “사용 안 함”으로 설정되어 있는 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
	echo 	Step2^) "대화형 로그온: 마지막 사용자 이름 표시 안 함"을 "사용"으로 설정
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(“마지막 사용자 이름 표시 안 함”이 “사용”으로 설정되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.