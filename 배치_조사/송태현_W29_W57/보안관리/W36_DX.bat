@echo off
setlocal enabledelayedexpansion

echo W-36 START
echo. 
echo [W36] 백신 프로그램 설치
echo.
echo ■ 진단 현황

set found=0

for %%i in (Ahnlab Avast Alyac) do (
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node" /s | find /I "%%i" > nul
    if !errorlevel! EQU 0 (
        set found=1
        break
    )
) 

if %found% EQU 1 (
    echo ■ 결과: 안전
    exit /b
) else (
    echo ■ 결과: 위험
		echo ■ 조치방안 : 백신 프로그램을 설치 해주시길 바랍니다
)

endlocal