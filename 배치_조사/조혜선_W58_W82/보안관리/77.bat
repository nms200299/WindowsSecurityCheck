@echo off 

echo. W-77 LAN Manager 인증 수준
echo.
echo [ W-77 "LAN Manager 인증 수준" ]
echo.
secedit /EXPORT /CFG log.txt > nul
type log.txt | findstr /i "LmCompatibilityLevel"  | find "4,3" > nul
echo.
if not errorlevel 1 (
    echo ■ 결과: 양호
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 시작 - 실행 - SECPOL.MSC - 로컬 정책 - 보안 옵션
    echo Step 2 “네트워크 보안: LAN Manager 인증 수준” 정책에 NTLMv2 응답만 보내기” 설정
)
del log.txt