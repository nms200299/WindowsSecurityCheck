@echo off
echo ###################################################################################
echo [W32] 최신 HOT FIX 적용
echo.

echo ■ 진단 기준
echo 	양호 :  최신 Hotfix가 있는지 주기적으로 모니터링하고 반영하거나, PMS (Patch Management System) Agent가 설치되어 자동패치배포가 적용된 경우
echo 	취약 :  최신 Hotfix가 있는지 주기적으로 모니터 절차가 없거나, 최신 Hotfix를 반영하지 않은 경우, 또한 PMS(Patch Management System) Agent가 설치되어 있지 않거나, 설치되어 있으나 자동패치배포가 적용되지 않은 경우
echo.
echo.

echo ■ 진단 결과　
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /s | find /I "AUOptions" | find "1" > nul
if %errorlevel% EQU 1 (
	echo 	→ 주의 ^(판단불가^)
    echo ■ 조치 방안
	echo 	- 수동 HOT FIX 적용 -
	echo 	아래의 사이트에서 패치 리스트를 조회하여, 서버에 필요한 패치를 선별하여 수동으로 설치함
	echo	 https://technet.microsoft.com/ko-kr/security/
	echo 	- 자동 HOT FIX 적용 -
	echo 	제어판 -^> windows update
	echo 	- PMS -
	echo 	Agent를 설치하여 자동으로 업데이트 되도록 설정
	call %CHK_FILE% WARN %1
)
echo.
echo.

