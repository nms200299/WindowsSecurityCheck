@echo off
echo W-38 START
echo.
echo [W38] 화면보호기 설정
echo.
echo ■ 진단 현황

setlocal enabledelayedexpansion


reg query "HKEY_CURRENT_USER\Control Panel\Desktop" | find /i "ScreenSaveActive" | find "1" > nul
if %errorlevel% NEQ 0 (
    echo ■ 결과: 위험
    echo ■ 조치 방안: 제어판 - 디스플레이 - 화면보호기변경 - 화면 보호기 사용
) else (
    reg query "HKEY_CURRENT_USER\Control Panel\Desktop" | find /i "ScreenSaverIsSecure" | find "1" > nul
    if !ERRORLEVEL! NEQ 0 (
        echo ■ 결과: 위험
        echo ■ 조치 방안: 제어판 - 디스플레이 - 화면보호기변경 - 다시 시작할 때 로그온 표시 체크
    ) else (
        for /F "tokens=3" %%a in ('reg query "HKEY_CURRENT_USER\Control Panel\Desktop" ^| find /i "ScreenSaveTimeOut"') do (
            set /a timeout=%%a
            if !timeout! GTR 600 (
                echo ■ 결과: 위험
                echo ■ 조치 방안: 제어판 - 디스플레이 - 화면보호기변경 - 대기 시간 설정
                echo 대기 시간이 600초 이상으로 설정되어 있음
            ) else (
                echo ■ 결과: 안전
                echo ■ 대기 시간 설정: !timeout! 초
            )
        )
    )
)

endlocal
