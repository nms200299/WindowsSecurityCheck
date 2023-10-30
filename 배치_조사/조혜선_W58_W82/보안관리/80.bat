@echo off
echo W-80 컴퓨터 계정 암호 최대 사용 기간
echo.
echo [ W-80 "컴퓨터 계정 암호 최대 사용 기간" ]
echo.
secedit /EXPORT /CFG log.txt > nul
type log.txt | findstr /i "MaximumPasswordAge=" >> MaxPwAge.txt
for /f "delims=',' tokens=2" %%a in (MaxPwAge.txt) do set MaxPwAge=%%a
type log.txt | findstr /i "DisablePasswordChange"  | find "4,1" > nul
if errorlevel 1 (
    if %MaxPwAge% leq 90 (
        echo ■ 결과: 양호
    ) else (
        echo ■ 결과: 취약
        echo "도메인 구성원: 컴퓨터 계정 암호 변경 사항 사용 안 함" 정책을 "사용 안 함"중 이지만
        echo "도메인 구성원: 컴퓨터 계정 암호의 최대 사용 기간"이 "90일" 초과이다.
        echo ■ 조치 방안
        echo Step 1 : 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
        echo Step 2 : "도메인 구성원: 컴퓨터 계정 암호의 최대 사용 기간" → 90일
    )
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 : 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
    echo Step 2 : "도메인 구성원: 컴퓨터 계정 암호 변경 사항 사용 안 함" → 사용 안 함, "도메인 구성원: 컴퓨터 계정 암호의 최대 사용 기간" → 90일
)
del log.txt
del MaxPwAge.txt