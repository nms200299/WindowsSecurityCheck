@echo off
echo ###################################################################################
echo [W62] 서비스 관리 - SNMP Access control 설정
echo.

echo ■ 진단 기준
echo 	양호 : 특정 호스트로부터 SNMP 패킷 받아들이기로 설정되어 있음.
echo 	취약 : 모든 호스트로부터 SNMP 패킷 받아들이기로 설정되어 있음.
echo.
echo.

echo ■ 진단 결과
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers /v 1 > nul
if %errorlevel% EQU 0 (
	echo 	→ 취약 ^(SNMP 서비스를 사용하지 않음^)
    echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SERVICES.MSC -^> SNMP Service 또는, SNMP 서비스  속성 -^> 보안
	echo    Step2^) “인증 트랩 보내기” 및 “다음 호스트로부터 SNMP 패킷 받아들이기” 선택
    echo    Step3^) SNMP 호스트 등록
    call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(SNMP 서비스를 사용함^)
    call %CHK_FILE% SAFE %1
)
echo.
echo.