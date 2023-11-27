@echo off
echo ###################################################################################
echo [W40] 보안 관리 - 원격 시스템에서 강제로 시스템 종료
echo.

echo ■ 진단 기준
echo 	양호 :  “원격 시스템에서 강제로 시스템 종료” 정책에 “Administrators”만 존재하는 경우
echo 	취약 :  : “원격 시스템에서 강제로 시스템 종료” 정책에 “Administrators” 외 다른 계정 및 그룹이 존재하는 경우
echo.          
echo.

echo ■ 진단 결과
set "flag=0"
call .\module\mod_createSecEdit.bat

for /F "tokens=1-3 delims=," %%a in ('type .\module\tmp\securityPolicy.txt ^| find /i "SeRemoteShutdownPrivilege"') do (
	echo %%a | findstr /C:"SeRemoteShutdownPrivilege = *S-1-5-32-544"
	if errorlevel 1 (
		set "flag=1"
	)
	rem 첫 번째 유저가 S-1-5-32-544가 아니면 취약


	if "%%b" NEQ "" (
		set "flag=1"
	)
	rem 두 번째 유저가 있으면 취약

)



if !flag! EQU 1 (
	echo 	→ 취약 ^(Administrators^(S-1-5-32-544^)만 존재하지 않습니다^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 사용자 권한 할당
	echo 	Step2^) “원격 시스템에서 강제로 시스템 종료” 정책에 Administrators 외 다른 계정 및 그룹 제거
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(Administrators^(S-1-5-32-544^)만 존재합니다^)
	call %CHK_FILE% SAFE %1
)

echo.
echo.
