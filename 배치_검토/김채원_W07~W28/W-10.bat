@echo off
echo ###################################################################################
echo [W10] 서비스 관리 - IIS서비스 구동 점검
echo.

echo ■ 진단 기준
echo 	양호 :  IIS 서비스가 현재 실행 중입니다.
echo 	취약 :  IIS 서비스가 현재 실행 중이지 않습니다.
echo.
echo.

echo ■ 진단 결과
sc query "W3SVC" | find /I "RUNNING"
if errorlevel 1 (
    echo 취약: W-10번 IIS 서비스가 현재 실행 중이지 않습니다.
) else (
    echo 안전: W-10번 IIS 서비스가 현재 실행 중입니다.
)
echo.
echo.
pause