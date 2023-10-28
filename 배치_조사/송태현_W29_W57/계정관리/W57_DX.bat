@echo off
setlocal enabledelayedexpansion

echo W-57 START
echo.
echo [W57] 원격터미널 접속 가능한 사용자 그룹 제한
echo.
echo ■ 진단 현황

for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" ^| find "REG_DWORD"') do (
    set "fDenyTSConnections=%%A"
)

if !fDenyTSConnections! equ 0 (
    echo 원격터미널 접속 가능한 사용자 그룹:
    net localgroup "Remote Desktop Users"
) else (
    echo ■ 결과: 위험
    echo ■ 조치 방안
    echo 제어판 - 시스템 - 원격 설정 - [원격] 탭 - [원격 데스크톱] 메뉴 - "이 컴퓨터에 대한 원격 연결 허용" 에 체크 - "사용자 선택" 
)

endlocal
