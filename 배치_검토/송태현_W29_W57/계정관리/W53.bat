@echo off
echo ###################################################################################
echo [W53] 계정 관리 - 로컬 로그온 허용
echo.

echo ■ 진단 기준
echo 	양호 :  로컬 로그온 허용 정책에 Administrators, IUSR_ 만 존재하는 경우
echo 	취약 :  로컬 로그온 허용 정책에 Administrators, IUSR_ 외 다른 계정 및 그룹이 존재하는 경우
echo 	주의 :  프로그램을 통해 판단할 수 없음.
echo.
echo.

echo ■ 진단 결과　
for /f "tokens=3" %%A in ('find /i "SeInteractiveLogonRight" ../tmp/securityPolicy.txt') do (
    set "SeInteractiveLogonRight=%%A"
)
rem "명령을 잘 실행했습니다." 문자만 빼고 출력
echo 	→ 주의 ^(판단 불가^)
echo.
echo.

echo ■ 조치 방안
echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 사용자 권한 할당
echo 	Step2^) "로컬 로그온 허용(또는, 로컬 로그온)" 정책에 "Adminstrators", "IUSR_" 외 다른 계정 및 그룹 제거
call %CHK_FILE% WARN %1
echo.
echo.