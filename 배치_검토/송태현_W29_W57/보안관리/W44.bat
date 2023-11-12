@echo off
echo ###################################################################################
echo [W44] 보안 관리 - 이동식 미디어 포맷 및 꺼내기 허용
echo.

echo ■ 진단 기준
echo 	양호 : “이동식 미디어 포맷 및 꺼내기 허용” 정책이 “Administrator”로 되어 있는 경우
echo 	취약 : “이동식 미디어 포맷 및 꺼내기 허용” 정책이 “Administrator”로 되어 있지 않은 경우
echo.
echo.

echo ■ 진단 결과
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /s | find /I "AllocateDASD" |find "0" > nul
if %errorlevel% NEQ 0 (
	echo 	→ 취약 ^(“이동식 미디어 포맷 및 꺼내기 허용” 정책이 “Administrator”로 되어 있지 않은 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
	echo 	Step2^) “장치 : 이동식 미디어 포맷 및 꺼내기 허용” 정책을 “Administrators” 로 설정
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(“이동식 미디어 포맷 및 꺼내기 허용” 정책이 “Administrator”로 되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.