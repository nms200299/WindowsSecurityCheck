@echo off
echo ###################################################################################
echo [W73] 보안 관리 - 사용자가 프린터 드라이버를 설치할 수 없게 함
echo.

echo ■ 진단 기준
echo 	양호 : “사용자가 프린터 드라이버를 설치할 수 없게 함” 정책 사용 중임.
echo 	취약 : “사용자가 프린터 드라이버를 설치할 수 없게 함” 정책이 “사용 안 함” 상태임.
echo.
echo.

echo ■ 진단 결과
secedit /EXPORT /CFG log.txt > nul
type log.txt | findstr /i "AddPrinterDrivers" | find "4,1" > nul
if %errorlevel% EQU 0 (
	echo 	→ 취약 ^(“사용자가 프린터 드라이버를 설치할 수 없게 함” 정책이 “사용 안 함” 상태임.^)
    echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SERVICES.MSC -^> 로컬 정책 -^> 보안 옵션
	echo    Step2^) “장치: 사용자가 프린터 드라이버를 설치할 수 없게 함” 정책을 “사용” 으로 설정
    call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(“사용자가 프린터 드라이버를 설치할 수 없게 함” 정책 사용 중임.^)
    call %CHK_FILE% SAFE %1
)
echo.
echo.