@echo off
echo ###################################################################################
echo [W47] 계정 관리 - 계정 잠금 기간 설정
echo.

echo ■ 진단 기준
echo 	양호 : “계정 잠금 기간” 및 “계정 잠금 기간 원래대로 설정 기간”이 설정되어 있는 경우(60분 이상의 값으로 설정하기를 권고함)
echo 	취약 : “계정 잠금 기간” 및 “잠금 기간 원래대로 설정 기간”이 설정되지 않은 경우
echo.
echo.

echo ■ 진단 결과
for /f "tokens=3" %%A in ('find /i "LockoutBadCount" ../tmp/securityPolicy.txt') do (
    set "LockoutBadCount=%%A"
)
if %LockoutBadCount% equ 0 (
	echo 	→ 취약 ^(“계정 잠금 기간” 및 “잠금 기간 원래대로 설정 기간”이 설정되지 않은 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 계정 정책 -^> 계정 잠금 정책
	echo 	Step2^) "계정 잠금 임계값" 설정후 "계정 잠금 기간" 및 "다음 시간 후 계정 잠금 수를 원래대로 설정" 의 값을 변경 - 60분 이상의 값을 권고
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(“계정 잠금 기간” 및 “계정 잠금 기간 원래대로 설정 기간”이 설정되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.