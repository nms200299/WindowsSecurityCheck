@echo off
echo ###################################################################################
echo [W72] 보안 관리 - Dos공격 방어 레지스트리 설정
echo.

echo ■ 진단 기준
echo 	양호 :  DoS 방어 레지스트리 값이 아래와 같이 설정되어 있음.
echo 	취약 :  DoS 방어 레지스트리 값이 아래와 같이 설정되어 있지 않은 경우.
echo    SynAttackProtect = REG_DWORD 0(False) -^> 1 이상
echo    EnableDeadGWDetect = REG_DWORD 1(True) -^> 0
echo    KeepAliveTime = REG_DWORD 7,200,000(2시간) -^> 300,000(5분)
echo    NoNameReleaseOnDemand = REG_DWORD 0(False) -^> 1
echo 	주의 :  프로그램을 통해 판단할 수 없음.
echo    ■ Windows 2012의 경우 영향을 받지 않음  ■
echo.
echo.

echo ■ 진단 결과　
net users | find /v "명령을 잘 실행했습니다."
rem "명령을 잘 실행했습니다." 문자만 빼고 출력
echo 	→ 주의 ^(판단 불가^)
echo.
echo.

echo ■ 조치 방안
echo 	Step1^) 시작 -^> 실행 -^> REGEDIT
echo 	Step2^) HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ 검색
echo    Step3^) DOS 방어 레지스트리 값 추가 또는, 변경
call %CHK_FILE% WARN %1
echo.
echo.