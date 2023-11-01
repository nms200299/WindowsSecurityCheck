@echo off

echo W-52 START
echo.
echo [W52] 마지막 사용자 이름 표시 안함
echo.
echo ■ 진단 현황

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" /s | find /I "DontDisplayLastUserName" | find "0x1" > nul
if %errorlevel% NEQ 0 (
    echo ■ 결과: 위험
    echo ■ 조치 방안
	echo Step 1. 시작 - 실행 - SECPOL.MSC - 로컬 정채 - 보안 옵션
    echo Step 2. "대화형 로그온: 마지막 사용자 이름 표시 안 함"을 "사용"으로 설정
) else (
    echo ■ 결과: 안전
)
