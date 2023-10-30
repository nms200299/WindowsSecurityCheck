@echo off

echo. W-61 SNMP 서비스 커뮤니티스트링의 복잡성 설정
echo.
echo [ W-61 "SNMP 서비스 커뮤니티스트링의 복잡성 설정" ]
echo.
net start | find /I "SNMP"
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo 직접 확인 필요
    echo.
    echo Step 1 시작 - 실행 - SERVICES.MSC - SNMP Service 또는, SNMP 서비스 - 속성 - 보안 - [인증 트랩 보내기] 아래 [추가] 버튼
    echo Step 2 [SNMP 서비스 구성] - 쓰기 권한이 필요하지 않다면 커뮤니티 이름을 읽기 전용으로 Public/Private이 아닌 이름을 추가
    echo Step 3 불필요 시 해당 서비스 제거
    echo 시작 - 실행 - SERVICES.MSC - SNMP Service 또는, SNMP 서비스 - 속성 [일반] 탭에서 “시작 유형”을 “사용 안 함”으로 설정한 후, SNMP 서비스 중지
)