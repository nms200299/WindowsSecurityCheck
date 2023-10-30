@echo off
echo. W-78 보안 채널 데이터 디지털 암호화 또는 서명
echo.
echo [ W-78 "보안 채널 데이터 디지털 암호화 또는 서명" ]
echo.
secedit /EXPORT /CFG log.txt > nul
type log.txt | find /i "RequireSignOrSeal" | find "4,0" > nul
if errorlevel 1 (
    type log.txt | find /i "SealSecureChannel" | find "4,0"
    if errorlevel 1 (
        type log.txt | find /i "SignSecureChannel" | find "4,0"
        if errorlevel 1 (
            echo ■ 결과: 양호
        ) else (
            echo ■ 결과: 취약
            echo ■ 조치 방안
            echo Step 1 : 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
            echo Step 2 : 아래 3가지 정책을 모두 "사용" 으로 설정
            echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명 [항상]
            echo - 도메인 구성원: 보안 채널 데이터 디지털 서명 [가능한 경우]
            echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 [가능한 경우]
        )
    ) else (
        echo ■ 결과: 취약
        echo ■ 조치 방안
        echo Step 1 : 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
        echo Step 2 : 아래 3가지 정책을 모두 "사용" 으로 설정
        echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명 [항상]
        echo - 도메인 구성원: 보안 채널 데이터 디지털 서명 [가능한 경우]
        echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 [가능한 경우]
    )
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 : 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
    echo Step 2 : 아래 3가지 정책을 모두 "사용" 으로 설정
    echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명 [항상]
    echo - 도메인 구성원: 보안 채널 데이터 디지털 서명 [가능한 경우]
    echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 [가능한 경우]
)
del log.txt