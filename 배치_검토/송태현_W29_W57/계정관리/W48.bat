@echo off
echo ###################################################################################
echo [W48] 계정 관리 - 패스워드 복잡성 설정
echo.

echo ■ 진단 기준
echo 	양호 : “암호는 복잡성을 만족해야 함” 정책이 “사용” 으로 되어 있는 경우.
echo 	취약 : “암호는 복잡성을 만족해야 함” 정책이 “사용 안 함” 으로 되어 있는 경우
echo.
echo.

echo ■ 진단 결과
for /f "tokens=3" %%A in ('find /i "PasswordComplexity" ../tmp/securityPolicy.txt') do (
    set "PasswordComplexity=%%A"
)

if %PasswordComplexity% equ 0 (
	echo 	→ 취약 ^(“암호는 복잡성을 만족해야 함” 정책이 “사용” 으로 되어 있는 경우.^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 계정 정책 -^> 암호 정책
	echo 	Step2^) "암호는 복잡성을 만족해야 함"을 "사용"으로 설정
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(“암호는 복잡성을 만족해야 함” 정책이 “사용 안 함” 으로 되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.