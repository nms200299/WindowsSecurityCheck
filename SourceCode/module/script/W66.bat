@echo off
echo [W66] 서비스 관리 - 불필요한 ODBC/OLE-DB 데이터 소스와 드라이브 제거
echo.

echo ■ 진단 기준
echo    양호 :  시스템 DSN 부분의 Data Source를 현재 사용하고 있는 경우
echo    취약 :  시스템 DSN 부분의 Data Source를 현재 사용하고 있지 않은 경우
echo    주의 :  프로그램을 통해 판단할 수 없음.
echo.
echo.

echo ■ 진단 결과　
echo    → 주의 ^(판단 불가^)
echo.
echo.

echo ■ 조치 방안
echo    Step1^) 시작 -^> 설정 -^> 제어판 -^> 관리 도구 -^> 데이터 원본 ^(ODBC^) -^> 시스템 DSN -^> 해당 드라이브 클릭
echo    Step2^) 사용하지 않는 데이터 소스 제거
call %CHK_FILE% WARN %1
echo.
echo.