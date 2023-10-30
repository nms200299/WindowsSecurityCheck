@echo off
echo W-62 SNMP Access control 설정
echo.
echo [ W-62 "SNMP Access control 설정" ]
echo.
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers /v 1 > nul
if not errorlevel 1 (
    echo ■ 결과: 양호
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 : 시작 - 실행 - SERVICES.MSC - SNMP Service[또는, SNMP 서비스] - 속성 - 보안
    echo Step 2 :"인증 트랩 보내기" 및 "다음 호스트로부터 SNMP 패킷 받아들이기" 선택
    echo Step 3 : SNMP 호스트 등록
)