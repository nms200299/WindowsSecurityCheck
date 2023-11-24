@echo off
echo ###################################################################################
echo [W50] 계정 관리 - 패스워드 최대 사용 기간
echo.

echo ■ 진단 기준
echo 	양호 : 최대 암호 사용 기간이 90일 이하로 설정되어 있는 경우
echo 	취약 : 최대 암호 사용 기간이 설정되지 않았거나 90일을 초과하는 값으로 설정된 경우
echo.
echo.

echo ■ 진단 결과
set "flag=0"
call .\module\mod_createSecEdit.bat
for /f "tokens=3" %%A in ('find /i "MaximumPasswordAge" .\module\tmp\securityPolicy.txt') do (
    set /a "MaximumPasswordAge=%%A"
)

if %MaximumPasswordAge% gtr 90 (set "flag=1")
if %MaximumPasswordAge% equ -1 (set "flag=1")

if !flag! equ 1 (
	echo 	→ 취약 ^(최대 암호 사용 기간이 설정되지 않았거나 90일을 초과하는 값으로 설정된 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 계정 정책 -^> 암호 정책
	echo 	Step2^) "최대 암호 사용 기간"의 "사용 기간"을 "90일"로 설정
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(최대 암호 사용 기간이 90일 이하로 설정되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.