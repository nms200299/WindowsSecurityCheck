@echo off
echo ###################################################################################
echo [W78] 보안 관리 - 보안 채널 데이터 디지털 암호화 또는 서명
echo.

echo ■ 진단 기준
echo 	양호 : 아래 3가지 정책이 "사용"으로 되어 있음.
echo 	취약 : 아래 3가지 정책이 "사용 안 함"으로 되어 있음.
echo    도메인 구성원 : 보안 채널 데이터를 디지털 암호화 또는 서명
echo    도메인 구성원 : 보안 채널 데이터를 디지털 암호화
echo    도메인 구성원 : 보안 채널 데이터를 디지털 서명
echo.
echo.

echo ■ 진단 결과
secedit /EXPORT /CFG log.txt > nul
type log.txt | find /i "RequireSignOrSeal" | find "4,0" > nul
if %errorlevel% EQU 0 (
    type log.txt | find /i "SealSecureChannel" | find "4,0"
    if %errorlevel% EQU 0 (
        type log.txt | find /i "SignSecureChannel" | find "4,0"
        if %errorlevel% EQU 0 (
        ) else(
            echo 	→ 취약 ^(아래 3가지 정책이 "사용 안 함"으로 되어 있음.^)
            echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
            echo 	Step2^) 아래 3가지 정책을 모두 "사용" 으로 설정
            echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명 '항상'
            echo - 도메인 구성원: 보안 채널 데이터 디지털 서명 '가능한 경우'
            echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 '가능한 경우'
            call %CHK_FILE% PWN %1
        )
    ) else (
        echo 	→ 취약 ^(아래 3가지 정책이 "사용 안 함"으로 되어 있음.^)
        echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
        echo 	Step2^) 아래 3가지 정책을 모두 "사용" 으로 설정
        echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명 '항상'
        echo - 도메인 구성원: 보안 채널 데이터 디지털 서명 '가능한 경우'
        echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 '가능한 경우'
        call %CHK_FILE% PWN %1
    )
) else (
	echo 	→ 취약 ^(아래 3가지 정책이 "사용 안 함"으로 되어 있음.^)
    echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
    echo 	Step2^) 아래 3가지 정책을 모두 "사용" 으로 설정
    echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명 '항상'
    echo - 도메인 구성원: 보안 채널 데이터 디지털 서명 '가능한 경우'
    echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 '가능한 경우'
    call %CHK_FILE% PWN %1
)