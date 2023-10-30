@echo off

echo. W-66 불필요한 ODBC/OLE-DB 데이터 소스와 드라이브 제거
echo.
echo [ W-66 "불필요한 ODBC/OLE-DB 데이터 소스와 드라이브 제거" ]
echo.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI"
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources"
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 시작 - 설정 - 제어판 - 관리 도구 - ODBC 데이터 원본 - 시스템 DSN - 해당 드라이브 클릭
    echo Step 2 사용하지 않는 데이터 소스 제거
)