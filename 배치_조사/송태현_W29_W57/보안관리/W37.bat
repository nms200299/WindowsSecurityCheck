@echo off
echo W-37 START
echo.
echo [W37] SAM 파일 접근 통제 설정
echo.
echo ■ 진단 현황
icacls %systemroot%\system32\config\SAM | findstr /V /C:"SYSTEM" /C:"Administrator" /C:"NT AUTHORITY\SYSTEM" /C:"BUILTIN\Administrators" | FIND ":(F)" > nul
if %errorlevel% equ 0 (
    echo ■ 결과 : 위험
    echo ■ 조치 방안
    echo Step 1. %systemroot%\system32\config\SAM - 속성 - 보안
    echo Step 2. Administratirm system 그룹 외 다른 사용자 및 그룹 권한 제거
) else (
    echo ■ 결과 : 안전
)
