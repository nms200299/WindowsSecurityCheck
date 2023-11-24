@echo off
echo ###################################################################################
echo [W51] 계정 관리 - 패스워드 최소 사용 기간
echo.

echo ■ 진단 기준
echo 	양호 : 최소 암호 사용 기간이 0보다 큰 값으로 설정되어 있는 경우
echo 	취약 : 최소 암호 사용 기간이 0으로 설정되어 있는 경우
echo.
echo.

echo ■ 진단 결과
call .\module\mod_createSecEdit.bat
for /f "tokens=3" %%A in ('find /i "MinimumPasswordAge" .\module\tmp\securityPolicy.txt') do (
    set "MinimumPasswordAge=%%A"
)

if %MinimumPasswordAge% equ 0 (
	echo 	→ 취약 ^(최소 암호 사용 기간이 0으로 설정되어 있는 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 계정 정책 -^> 암호 정책
	echo 	Step2^) "최소 암호 사용 기간"에서 "사용 기간"을 "1일"로 설정
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(최소 암호 사용 기간이 0보다 큰 값으로 설정되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.