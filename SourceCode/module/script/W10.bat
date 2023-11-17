@echo off
echo ###################################################################################
echo [W10] 서비스 관리 - IIS서비스 구동 점검
echo.

echo ■ 진단 기준
echo 	양호 :  IIS 서비스를 사용하지 않음.
echo 	경고 :  IIS 서비스를 사용하는 경우, 필요한지 확인 요망.
echo.
echo.

echo ■ 진단 결과
sc query "W3SVC" | find /I "RUNNING"
if errorlevel 1 (
    echo    → 양호 ^(IIS 서비스를 사용하지 않음^)
    call %CHK_FILE% SAFE %1
) else (
    echo    → 경고 ^(IIS 서비스를 사용함, 필요한지 확인 요망^)
    echo.
    echo.
    echo ■ 조치 방안
    echo    Step1^) IISADMIN 서비스 존재 : 시작 -^> 실행 -^> SERVICES.MSC -^> IISADMIN -^> 속성 -^> "시작 유형"을 "사용 안 함" 설정 후 중지
    echo    Step2^) IISADMIN 서비스 미존재 : 서버관리자 -^> 관리 -^> 역할 및 기능 제거 -^> 서버 역할 -^> 웹 서버^(UUS^), 선택 후 제거
    call %CHK_FILE% WARN %1
)
echo.
echo.