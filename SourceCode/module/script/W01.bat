@echo off
echo ###################################################################################
echo [W01] 계정관리 - Administrator 계정 이름 바꾸기
echo.

echo ■ 진단 기준
echo 	양호 :  Administrator 이름의 계정이 존재하지 않음.
echo 	취약 :  Administrator 이름의 계정이 존재함.
echo.
echo.

echo ■ 진단 결과　
net users | find /i "Administrator"
rem 대소문자 상관없이 비교
rem (Administrator에서 administrator으로 변경한다고 유추가 어려운 것이 아님으로.)

if %errorlevel% EQU 0 (
	echo 	→ 취약 ^(Administrator 계정 존재^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 프로그램 -^> 제어판 -^> 관리도구 -^> 로컬 보안 정책 -^> 로컬 정책 -^> 보안옵션
	echo 	Step2^) "계정: Administrator 계정 이름 바꾸기"를 유추하기 어려운 계정 이름으로 변경
	call %CHK_FILE% PWN %1

) else (
	echo 	→ 양호 ^(Administrator 계정 미존재^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.