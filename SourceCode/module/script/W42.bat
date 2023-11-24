@echo off
echo ###################################################################################
echo [W42] 보안 관리 - SAM 계정과 공유의 익명 열거 허용 안함
echo.

echo ■ 진단 기준
echo 	양호 : 해당 보안 옵션 값이 설정 되어 있는 경우
echo 	취약 : 해당 보안 옵션 값이 설정 되어 있지 않는 경우
echo.
echo.

echo ■ 진단 결과
set "flag=0"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | findstr /I /C:"RestrictAnonymous " | find "0x1" > nul
if %errorlevel% NEQ 0 (
	set "flag=1"
)
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /s | findstr /I /C:"restrictanonymoussam " | find "0x1" > nul
if %errorlevel% NEQ 0 (
	set "flag=1"
)

if !flag! EQU 1 (
	echo 	→ 취약 ^(해당 보안 옵션 값이 설정 되어 있지 않는 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
	echo 	Step2^) "네트워크 액세스 : “SAM 계정과 공유의 익명 열거 허용 안 함”과
	echo                              “네트워크 액세스 :SAM 계정의 익명 열거 허용 안 함”에 “사용” 선택
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(해당 보안 옵션 값이 설정 되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.