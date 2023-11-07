@echo off
echo. W-63 DNS 서비스 구동 점검
echo.
echo [ W-63 "DNS 서비스 구동 점검" ]
echo.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\dx" | find /v 1
if errorlevel 1 (
echo ■ 결과: 양호
) else (
echo ■ 결과: 취약
echo ■ 조치 방안
echo Step 1 DNS 관리자'dnsmgmt.msc' - 각 조회 영역 - 속성 - '동적 업데이트' 설정 확인
)