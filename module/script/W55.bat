@echo off
echo ###################################################################################
echo [W55] 계정 관리 - 최근 암호 기억
echo.

echo ■ 진단 기준
echo 	양호 : 최근 암호 기억이 4개 이상으로 설정되어 있는 경우
echo 	취약 : 최근 암호 기억이 4개 미만으로 설정되어 있는 경우
echo.
echo.

echo ■ 진단 결과
call .\module\mod_createSecEdit.bat
for /f "tokens=3" %%A in ('find /i "PasswordHistorySize" .\module\tmp\securityPolicy.txt') do (
    set "PasswordHistorySize=%%A"
) 

if %PasswordHistorySize% lss 4 (
	echo 	→ 취약 ^(최근 암호 기억이 4개 미만으로 설정되어 있는 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 계정 정책 -^> 암호 정책
	echo 	Step2^) "최근 암호 기억"을 "4개 암호 기억됨"으로 설정
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(최근 암호 기억이 4개 이상으로 설정되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.