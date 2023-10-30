@echo off

echo. W-60 SNMP 서비스 구동 점검
echo.
echo [ W-60 "SNMP 서비스 구동 점검" ]
echo.
net start | find /I "SNMP"
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 불필요 시 해당 서비스 제거
    echo 시작- 실행- SERVICES.MSC - SNMP Service 또는, SNMP 서비스- 속성에서 “시작 유형”을 “사용 안 함”으로 설정한 후, SNMP 서비스를 중지함
)