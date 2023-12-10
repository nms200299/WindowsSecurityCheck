@echo off
echo ###################################################################################
echo [W54] 계정 관리 - 익명 SID/이름 변환 허용 해제
echo.

echo ■ 진단 기준
echo 	양호 : “익명 SID/이름 변환 허용” 정책이 “사용 안 함” 으로 되어 있는 경우
echo 	취약 : “익명 SID/이름 변환 허용” 정책이 “사용” 으로 되어 있는 경우
echo.
echo.

echo ■ 진단 결과
call .\module\mod_createSecEdit.bat
for /f "tokens=3" %%A in ('find /i "LSAAnonymousNameLookup" .\module\tmp\securityPolicy.txt') do (
    set "LSAAnonymousNameLookup=%%A"
)

if %LSAAnonymousNameLookup% neq 0 (
	echo 	→ 취약 ^(“익명 SID/이름 변환 허용” 정책이 “사용” 으로 되어 있는 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
	echo 	Step2^) "네트워크 액세스: 익명 SID/이름 변환 허용" 정책이 "사용 안 함"으로 설정
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(“익명 SID/이름 변환 허용” 정책이 “사용 안 함” 으로 되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.