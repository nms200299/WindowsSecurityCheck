@echo off
echo ###################################################################################
echo [W57] 계정 관리 - 원격터미널 접속 가능한 사용자 그룹 제한
echo.

echo ■ 진단 기준
echo 	양호 :  (관리자 계정을 제외한) 원격접속이 가능한 계정을 생성하여 타 사용자의 원격접속을 제한하고, 원격접속 사용자 그룹에 불필요한 계정이 등록되어 있지 않은 경우
echo 	취약 :  (관리자 계정을 제외한) 원격접속이 가능한 별도의 계정이 존재하지 않는 경우
echo 	주의 :  프로그램을 통해 판단할 수 없음.
echo.
echo.

echo ■ 진단 결과　
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections
rem "명령을 잘 실행했습니다." 문자만 빼고 출력
echo 	→ 주의 ^(판단 불가^)
echo.
echo.

echo ■ 조치 방안
echo 	Step1^) 제어판 -^> 사용자 계정 -^> 계정 관리 -^> 관리자 계정 이외의 계정 생성한 후
echo 	Step2^) 제어판 -^> 시스템 -^> 원격 설정 -^> [원격] 탭 -^> [원격 데스크톱] 메뉴 -^> "이 컴퓨터에 대한 원격 연결 허용" 에 체크 -^> "사용자 선택" 에서 원격 사용자 지정 후 확인
call %CHK_FILE% WARN %1
echo.
echo.
