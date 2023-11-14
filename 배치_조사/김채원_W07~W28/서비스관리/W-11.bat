@echo off
echo ###################################################################################
echo [W11] 서비스 관리 - 디렉토리 리스팅 제거
echo.

echo ■ 진단 기준
echo 	양호 :  디렉토리 리스팅을 가져올 수 있습니다.
echo 	취약 :  디렉토리 리스팅을 가져올 수 없습니다.
echo.
echo.

echo ■ 진단 결과　
dir /b "C:\Windows\System32" > nul 2>&1
if errorlevel 1 (
    echo 양호: 디렉토리 리스팅을 가져올 수 없습니다.
) else (
    echo 취약: 디렉토리 리스팅을 가져올 수 있습니다.
)
pause