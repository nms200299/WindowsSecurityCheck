@echo off

echo. W-75 경고 메시지 설정
echo.
echo [ W-75 "경고 메시지 설정" ]
echo.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system"
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
    echo Step 2 대화형 로그온: 로그온 시도하는 사용자에 대한 메시지 제목: 배너 제목 입력
    echo Step 3 대화형 로그온: 로그온 시도하는 사용자에 대한 메시지 텍스트: 배너 내용 입력
)