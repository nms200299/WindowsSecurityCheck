@echo off
echo. W-67 원격터미널 접속 타임아웃 설정
echo.
echo [ W-67 "원격터미널 접속 타임아웃 설정" ]
echo.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" | findstr /I "MaxIdleTime" > nul
echo.
if not errorlevel 1 (
    echo ■ 결과: 양호
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1: 시작 - 실행 - GPEDIT.MSC[로컬 그룹 정책 편집기]
    echo Step 2: 컴퓨터 구성 - 관리 템플릿 - Windows 구성 요소 - 터미널 서비스 - 원격 데스크톱세션 호스트 - 세션 시간 제한
    echo Step 3: [활성 상태지만 유휴 터미널 서비스 세션에 시간제한 설정] - [유휴 세션 제한]을 "30분"으로 설정
)