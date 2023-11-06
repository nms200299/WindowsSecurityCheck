@echo off
echo ###################################################################################
echo [W06] 계정관리 - 관리자 그룹에 최소한의 사용자 포함
echo.

echo ■ 진단 기준
echo 	양호 : Administrators 그룹의 구성원을 1명 이하로 유지하거나,
echo			불필요한 관리자 계정이 존재하지 않음.
echo 	취약 : Administrators 그룹에 불필요한 관리자 계정이 존재함.
echo 	주의 :  프로그램을 통해 판단할 수 없음.
echo.
echo.

echo ■ 진단 결과
net localgroup Administrators | find /v "명령을 잘 실행했습니다."
rem "명령을 잘 실행했습니다." 문자만 빼고 출력
echo 	→ 주의 ^(판단 불가^)
echo.
echo.

echo ■ 조치 방안
echo 	Step1^) 시작 -^> 실행 -^> LUSRMGR.MSC -^> 그룹 -^> Administrators -^> 속성
echo 	Step2^) Administrators 그룹에서 불필요한 계정 제거 후 그룹 변경
call %CHK_FILE% WARN %1
echo.
echo.