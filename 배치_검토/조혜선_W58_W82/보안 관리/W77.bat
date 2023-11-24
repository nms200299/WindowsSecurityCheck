@echo off
echo ###################################################################################
echo [W77] 보안 관리 - LAN Manager 인증 수준
echo.

echo ■ 진단 기준
echo 	양호 : "LAN Manager 인증 수준" 정책에 "NTLMv2 응답만 보냄"이 설정되어 있음.
echo 	취약 : "LAN Manager 인증 수준" 정책에 "LM" 및 "NTLM"인증이 설정되어 있음.
echo.
echo.

echo ■ 진단 결과
secedit /EXPORT /CFG log.txt > nul
type log.txt | findstr /i "LmCompatibilityLevel"  | find "4,3" > nul
if %errorlevel% EQU 0 (
	echo 	→ 취약 ^("LAN Manager 인증 수준" 정책에 "LM" 및 "NTLM"인증이 설정되어 있음.^)
    echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
	echo    Step2^) “네트워크 보안: LAN Manager 인증 수준” 정책에 NTLMv2 응답만 보내기” 설정
    call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^("LAN Manager 인증 수준" 정책에 "NTLMv2 응답만 보냄"이 설정되어 있음.^)
    call %CHK_FILE% SAFE %1
)
echo.
echo.