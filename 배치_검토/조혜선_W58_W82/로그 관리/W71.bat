@echo off

echo. W-71 원격에서 이벤트 로그 파일 접근 차단
echo.
echo [ W-71 "원격에서 이벤트 로그 파일 접근 차단 " ]
echo.
icacls %systemroot%\system32\Winevt\Logs | find /v "파일을 처리했으며"                             
icacls %systemroot%\system32\config | find /v "파일을 처리했으며"  
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 탐색기 - 로그 디렉터리 - 속성 - 보안
    echo Step 2 Everyone 권한 제거
)