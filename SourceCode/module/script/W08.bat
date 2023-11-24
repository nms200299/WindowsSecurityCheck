@echo off
echo ###################################################################################
echo [W08] 서비스 관리 - 하드디스크 기본 공유 제거
echo.

echo ■ 진단 기준
echo 	양호 :  AutoShareServer 레지스트리 값이 0이며, 기본 공유가 존재하지 않음.
echo 	취약 :  AutoShareServer 레지스트리 값이 1이거나, 기본 공유가 존재함.
echo.
echo.

echo ■ 진단 결과
set flag=0
net share | findstr /R "^[A-Z]\$"
if errorlevel 1 (
    echo    step 1^) 하드디스크 기본 공유가 제거되어 있습니다. ^(양호^)
) else (
    echo    step 1^) 하드디스크 기본 공유가 존재합니다. ^(취약^)
    set flag=1
)

set KeyName=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters
set ValueName=AutoShareServer
reg query %KeyName% /v %ValueName% 2>nul
if errorlevel 1 (
    echo    step 2^) AutoShareServer 레지스트리가 없습니다. ^(양호^)
) else (
    for /f "tokens=2*" %%a in ('reg query %KeyName% /v %ValueName%') do set RegValue=%%b

    if !RegValue! EQU 0 (
        echo    step 2^) AutoShareServer 레지스트리 값이 0입니다. ^(양호^)
    ) else if !RegValue! EQU 1 (
        echo    step 2^) AutoShareServer 레지스트리 값이 1입니다. ^(취약^)
        set flag=1
    )

)

if !flag! EQU 1 (
    echo    → 취약 ^(위 내용에 따라 하나 이상의 항목이 취약합니다^)
    echo.
    echo.
    echo ■ 조치 방안
    echo    step 1^) 시작 ^> 실행 ^> FSMGMT.MSC ^> 공유 ^> 기본 공유 선택 ^> 마우스 우클릭 ^> 공유 금지
    echo    step 2^) 시작 ^> 실행 ^> REGEDIT 해당 레지스트리 값 0으로 수정
    echo    경로 및 수정파일 : "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareServer"
    call %CHK_FILE% PWN %1
) else (
    echo    → 양호 ^(위 내용에 따라 하나 양호합니다^)
    call %CHK_FILE% SAFE %1
)

echo.
echo.
