@echo off
echo ###################################################################################
echo [W65] 서비스 관리 - Telnet 보안 설정
echo.

echo ■ 진단 기준
echo 	양호 : Telnet 서비스가 구동 되어 있지 않거나 인증 방법이 NTLM 상태임.
echo 	취약 : Telnet 서비스가 구동 되어 있으며 인증 방법이 NTLM이 아닌 상태임.
echo.
echo.

echo ■ 진단 결과
net start | find /I "Telnet"
if errorlevel 1 (
	echo 	→ 양호 ^(Telnet 서비스를 사용하지 않음^)
    call %CHK_FILE% SAFE %1
) else (
    reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\TelnetServer\1.0" /v "SecurityMechanism" | findstr /C:"0x2"

    if not errorlevel 1 (
        echo    → 양호 ^(인증 방법을 NTLM만 사용하고 있음^)
        call %CHK_FILE% SAFE %1
    ) else (
        echo    → 취약 ^(인증 방법이 NTLM이 아니거나, NTLM만 사용하고 있지 않음^)
        echo.
        echo.
        echo ■ 조치 방안
        echo    Step1^) 시작 -^> 실행 -^> cmd -^> tlntadmn config
        echo    Step2^) tlntadmn config sec = +NTLM -passwd 'passwd 인증 방식을 제외하고 NTLM 인증 방식만 사용'
        echo    Step3^) 시작 -^> 실행 -^> SERVICES.MSC -^> Telnet -^> 속성 '일반' 탭에서 "시작 유형"을 "사용 안 함"으로 설정한 후 Telnet 서비스 중지
        call %CHK_FILE% PWN %1
    )
)
echo.
echo.