@echo off

echo W-32 START
echo.
echo [W32] 최신 HOT FIX 적용
echo.
echo ■ 진단 현황

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /s | find /I "AUOptions" | find "0" > nul
if %errorlevel% NEQ 0 (
    echo ■ 결과: 위험
    echo ■ 조치 방안
		echo - 수동 HOT FIX 적용 -
		echo 아래의 패치 리스트를 조회하여 서버에 필요한 패치를 선별하여 수동으로 설치함
		echo - 자동 HOT FIX 적용 -
		echo 제어판 - windows update
		echo - PMS -
		echo Agent를 설치하여 자동으로 업데이트 되도록 설정
) else (
    echo ■ 결과: 안전
)