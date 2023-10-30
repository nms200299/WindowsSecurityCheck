@echo off

echo. W-65 Telnet 보안 설정
echo.
echo [ W-65 "Telnet 보안 설정" ]
echo.
net start | find /I "Telnet"
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\TelnetServer\1.0" | find /I "NTLM"
    if not errorlevel 1 (
        echo ■ 결과: 양호
    ) else (
        echo ■ 결과: 취약
        echo ■ 조치 방안
        echo Step 1 시작 - 실행 - cmd - tlntadmn config
        echo Step 2 tlntadmn config sec = +NTLM -passwd "passwd 인증 방식을 제외하고 NTLM 인증 방식만 사용"
        echo Step 3 불필요 시 해당 서비스 제거
        echo 시작- 실행 - SERVICES.MSC - Telnet - 속성 [일반] 탭에서 "시작 유형"을 "사용 안 함"으로 설정한 후 Telnet 서비스 중지
    )

)