@echo off

echo. W-63 DNS 서비스 구동 점검
echo.
echo [ W-63 "DNS 서비스 구동 점검" ]
echo.
net start | find /I "DNS Server"                                 
net start | find /I "DNS Server"                                   
net start | find /I "DNS Client"                            
net start | find /I "DNS Client"
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 시작 - 실행 - DNSMGMT.MSC - 각 조회 영역 - 해당 영역 - 속성 - 일반
    echo Step 2 동적 업데이트 → 없음 또는 아니오 선택
    echo Step 3 불필요 시 해당 서비스 제거 시작 - 실행 - SERVICES.MSC - DNS 서버 - 속성 [일반] 탭에서 "시작 유형"을 "사용 안 함"으로 설정한 후, DNS 서비스 중지
)