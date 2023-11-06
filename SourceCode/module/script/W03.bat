@echo off
echo ###################################################################################
echo [W03] 계정관리 - 불필요한 계정 제거
echo.

echo ■ 진단 기준
echo 	양호 :  불필요한 계정이 존재하지 않음.
echo 	취약 :  불필요한 계정이 존재함.
echo 	주의 :  프로그램을 통해 판단할 수 없음.
echo.
echo.

echo ■ 진단 결과　
net users | find /v "명령을 잘 실행했습니다."
rem "명령을 잘 실행했습니다." 문자만 빼고 출력
echo 	→ 주의 ^(판단 불가^)
echo.
echo.

echo ■ 조치 방안
echo 	Step1^) 시작 -^> 실행 -^> LUSRMGR.MSC -^> 사용자
echo 	Step2^) 등록된 계정 중 불필요한 사용자 선택 -^> 속성 -^> "계정 사용 안 함"에 체크하거나 계정 삭제
call %CHK_FILE% WARN
echo.
echo.