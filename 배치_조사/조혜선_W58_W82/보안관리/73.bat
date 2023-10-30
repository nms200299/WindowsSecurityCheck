@echo off

echo. W-73 사용자가 프린터 드라이버를 설치할 수 없게 함
echo.
echo [ W-73 "사용자가 프린터 드라이버를 설치할 수 없게 함" ]
echo.
secedit /EXPORT /CFG log.txt > nul
type log.txt | findstr /i "AddPrinterDrivers" | find "4,1" > nul
echo.
if not errorlevel 1 (
    echo ■ 결과: 양호
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 : 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
    echo Step 2 : “장치: 사용자가 프린터 드라이버를 설치할 수 없게 함” 정책을 “사용” 으로 설정
)
del log.txt