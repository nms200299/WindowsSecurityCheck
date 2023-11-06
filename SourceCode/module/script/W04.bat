@echo off
echo ###################################################################################
echo [W04] 계정 관리 - 계정 잠금 임계값 설정
echo.

echo ■ 진단 기준
echo 	양호 : 계정 잠금 임계값이 5 이하의 값으로 설정되어 있음.
echo 	취약 : 계정 잠금 임계값이 6 이상의 값으로 설정되어 있음.
echo.
echo.

echo ■ 진단 결과
call .\module\mod_createSecEdit.bat
set "filePath=.\module\tmp\securityPolicy.txt"
set "result="
setlocal enabledelayedexpansion
for /f "tokens=1-2 delims==" %%a in ('type %filePath%') do (
	if "%%a" == "LockoutBadCount " (
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
		echo 	→ 취약 ^(계정 잠금 임계값이 0^(아님^)이라고 설정되어 있음^)
		goto pwn
	) else if !result! GEQ 6 (
		echo 	→ 취약 ^(계정 잠금 임계값이 6 이상으로 설정되어 있음^)
		goto pwn
	) else (
		echo 	→ 양호 (계정 잠금 임계값이 0 초과, 5 이하로 설정되어 있음)
		call %CHK_FILE% SAFE %1
		goto next
	)

:pwn
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 계정 정책 -^> 계정 잠금 정책
	echo 	Step2^) "계정 잠금 임계값"을 "5"이하의 값으로 설정
	call %CHK_FILE% PWN %1
	goto next
:next
	echo.
	echo.