@echo off
echo ###################################################################################
echo [W05] 계정관리 - 해독 가능한 암호화를 사용하여 암호 저장 해제
echo.

echo ■ 진단 기준
echo 	양호 : "해독 가능한 암호화를 사용하여 암호 저장" 정책이 "사용 안 함"으로 되어 있음.
echo 	취약 : "해독 가능한 암호화를 사용하여 암호 저장" 정책이 "사용"으로 되어 있음.
echo.
echo.

echo ■ 진단 결과
call .\module\mod_createSecEdit.bat
set "filePath=.\module\tmp\securityPolicy.txt"
set "result="
setlocal enabledelayedexpansion
for /f "tokens=1-2 delims==" %%a in ('type %filePath%') do (
	if "%%a" == "ClearTextPassword " (
		echo %%a=%%b
		set "result=%%b"
		rem 항목명과 값을 출력하고 값을 변수에 저장
		set "result=!result:~1,1!"
		rem 값에서 스페이스 자름
		set /a "result=!result!"
		rem 값을 상수로 변환
		goto break
	)
)
:break
	if !result! EQU 0 (
		echo 	→ 양호 ^(해당 정책을 사용하지 않음^)
		call %CHK_FILE% SAFE
	) else (
		echo 	→ 취약 ^(해당 정책을 사용함^)
		echo.
		echo.
		echo ■ 조치 방안
		echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 계정 정책 -^> 암호 정책
		echo 	Step2^) "해독 가능한 암호화를 사용하여 암호 저장"을 "사용 안 함"으로 설정
		call %CHK_FILE% PWN
	)
	echo.
	echo.