@echo off

echo. W-76 사용자별 홈 디렉터리 권한 설정
echo.
echo [ W-76 "사용자별 홈 디렉터리 권한 설정" ]
echo.
icacls C:\Users\* | find /v "파일을 처리했으며"
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 C:\사용자\<사용자 계정>
    echo Step 2 해당 사용자에 대한 권한 외 일반 계정 삭제
)