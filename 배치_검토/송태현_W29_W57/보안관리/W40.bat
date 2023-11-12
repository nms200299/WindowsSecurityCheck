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

find /i "SeRemoteShutdownPrivilege" ../tmp/securityPolicy.txt | find /v "---------- ../TMP/SECURITYPOLICY.TXT"
echo 	→ 주의 ^(판단 불가^)
echo.
echo.

echo ■ 조치 방안
echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 사용자 권한 할당
echo 	Step2^) “원격 시스템에서 강제로 시스템 종료” 정책에 Administrators 외 다른 계정 및 그룹 제거
call %CHK_FILE% WARN %1
echo.
echo.
