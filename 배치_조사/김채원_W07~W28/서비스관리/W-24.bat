@echo off
echo ###################################################################################
echo [W24] 서비스 관리 - NetBIOS 바인딩 서비스 구동 점검
echo.

echo ■ 진단 기준
echo 	양호 :  TCP/IP와 NetBIOS 간의 바인딩이 제거 되어 있는 경우
echo 	취약 :  TCP/IP와 NetBIOS 간의 바인딩이 제거 되어 있지 않는 경우
echo.
echo.

echo ■ 진단 결과　
set "netbiosStatus="
for /f "tokens=3*" %%i in ('sc query NetBT ^| find "STATE"') do set "netbiosStatus=%%j"

if not "!netbiosStatus!"=="" (
    echo NetBIOS 바인딩 서비스가 현재 구동 중입니다.

    REM 취약 상태로 판단하고 조치 방법을 안내합니다.
    echo 취약


) else (
    echo NetBIOS 바인딩 서비스가 현재 비활성화되어 있습니다.
    echo 양호
)
echo.
echo.
pause