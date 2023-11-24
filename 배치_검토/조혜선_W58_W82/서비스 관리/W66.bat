@echo off

echo. W-66 불필요한 ODBC/OLE-DB 데이터 소스와 드라이브 제거
echo.
echo [ W-66 "불필요한 ODBC/OLE-DB 데이터 소스와 드라이브 제거" ]
echo.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\dx" | find /v 1         
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 DNS 관리자'dnsmgmt.msc' - 각 조회 영역 - 속성 - '동적 업데이트' 설정 확인
)

