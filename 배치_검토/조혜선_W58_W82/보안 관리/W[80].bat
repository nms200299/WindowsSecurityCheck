@echo off
echo ###################################################################################
echo [W80] 보안 관리 - 컴퓨터 계정 암호 최대 사용 기간
echo.

echo ■ 진단 기준
echo 	양호 : "컴퓨터 계정 암호 변경 사용 안 함" 정책을 사용하지 않으며, "컴퓨터 계정 암호 최대 사용 기간" 정책이 "90일"로 설정되어 있음.
echo 	취약 : "컴퓨터 계정 암호 변경 사용 안 함" 정책이 “사용”으로 설정되어 있거나 "컴퓨터 계정 암호 최대 사용 기간" 정책이 “90일” 로 설정되어 있지 않음. 
echo.
echo.

echo ■ 진단 결과
secedit /EXPORT /CFG log.txt > nul
type log.txt | findstr /i "MaximumPasswordAge=" >> MaxPwAge.txt
for /f "delims=',' tokens=2" %%a in (MaxPwAge.txt) do set MaxPwAge=%%a
type log.txt | findstr /i "DisablePasswordChange"  | find "4,1" > nul
if %errorlevel% EQU 0 (
    if %MaxPwAge% leq 90 (
	echo 	→ 양호 ^("컴퓨터 계정 암호 최대 사용 기간" 정책이 "90일"로 설정되어 있음.^)
    call %CHK_FILE% SAFE %1
    ) else (
	echo 	→ 취약 ^("컴퓨터 계정 암호 최대 사용 기간" 정책이 “90일” 로 설정되어 있지 않음.^)
        echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
    echo    Step2^) "도메인 구성원: 컴퓨터 계정 암호의 최대 사용 기간" → 90일
    echo "도메인 구성원: 컴퓨터 계정 암호 변경 사항 사용 안 함" 정책을 "사용 안 함"중 이지만
    echo "도메인 구성원: 컴퓨터 계정 암호의 최대 사용 기간"이 "90일" 초과이다.
    call %CHK_FILE% PWN %1
) else (
	echo 	→ 취약 ^("컴퓨터 계정 암호 변경 사용 안 함" 정책이 “사용”으로 설정되어 있거나 "컴퓨터 계정 암호 최대 사용 기간" 정책이 “90일” 로 설정되어 있지 않음.^)
    echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
    echo 	Step2^) "도메인 구성원: 컴퓨터 계정 암호 변경 사항 사용 안 함" → 사용 안 함, "도메인 구성원: 컴퓨터 계정 암호의 최대 사용 기간" → 90일
    call %CHK_FILE% PWN %1
)