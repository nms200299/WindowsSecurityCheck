@echo off
echo. W-74 세션 연결을 중단하기 전에 필요한 유휴시간
echo.
echo [ W-74 "세션 연결을 중단하기 전에 필요한 유휴시간" ]
echo.
secedit /EXPORT /CFG log.txt > nul
net config server /n | find "유휴" >> idle.txt
for /f "tokens=5" %%a in (idle.txt) do set idle=%%a
type log.txt | findstr /i "EnableForcedLogOff"  | find "4,0" > nul
if errorlevel 1 (
    if %idle% geq 15 (
        echo ■ 결과: 양호
    ) else (
        echo ■ 결과: 취약
        echo "로그온 시간이 만료되면 클라이언트 연결 끊기" 정책을 "사용"중 이지만
        echo "세션 연결을 중단하기 전에 필요한 유휴 시간"이 "15분" 미만이다.
        echo ■ 조치 방안
        echo Step 1 : 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
        echo Step 2 : "Microsoft 네트워크 서버: 세션 연결을 중단하기 전에 필요한 유휴 시간" 정책 "15분" 설정
    )
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 : 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
    echo Step 2 : "Microsoft 네트워크 서버: 로그온 시간이 만료되면 클라이언트 연결 끊기" 정책 "사용" 설정
)
del log.txt
del idle.txt