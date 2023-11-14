@echo off
echo ###################################################################################
echo [W60] 서비스 관리 - SNMP 서비스 구동 점검
echo.

echo ■ 진단 기준
echo 	양호 : SNMP 서비스를 사용하지 않음.
echo 	취약 : SNMP 서비스를 사용함.
echo.
echo.

echo ■ 진단 결과
net start | find /I "SNMP"
if %errorlevel% EQU 0 (
	echo 	→ 양호 ^(SNMP 서비스를 사용하지 않음^)
    call %CHK_FILE% SAFE %1
) else (
	echo 	→ 취약 ^(SNMP 서비스를 사용함^)
    echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SERVICES.MSC -^> SNMP Service 또는, SNMP 서비스 -^> 속성에서 “시작 유형”을 “사용 안 함”으로 설정한 후, SNMP 서비스를 중지함
	call %CHK_FILE% PWN %1
)
echo.
echo.