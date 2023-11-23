@echo off
echo ###################################################################################
echo [W08] 서비스 관리 - 하드디스크 기본 공유 제거
echo.

echo ■ 진단 기준
echo 	양호 :  하드디스크 기본 공유가 존재하지 않음
echo 	취약 :  하드디스크 기본 공유가 존재
echo.
echo.

echo ■ 진단 결과　
net share | findstr /r /c:"^[CDEFGHIJKLMNOPQRSTUVWXYZ]\$$" >nul
if errorlevel 1 (
    echo 양호: 하드디스크 기본 공유가 제거되어 있습니다.
) else (
    echo 취약: 하드디스크 기본 공유가 존재합니다.
)

echo ■ 조치 방안
echo step 1) 시작 ^> 실행 ^> FSMGMT.MSC ^> 공유 ^> 기본 공유 선택 ^> 마우스 우클릭 ^> 공유 금지
echo  step 2) 시작 ^> 실행 ^> REGEDIT 해당 레지스트리 값 0으로 수정
echo 경로 및 수정파일 : "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareServer"

echo.
echo.
pause