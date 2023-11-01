@ECHO OFF


ECHO ■ 기준
ECHO 양호 : "해독 가능한 암호화를 사용하여 암호 저장" 정책이 "사용 안 함" 으로 되어 있는 경우
ECHO 취약 : "해독 가능한 암호화를 사용하여 암호 저장" 정책이 "사용" 으로 되어 있는 경우


ECHO.
ECHO ■ 현황
secedit /export /cfg LocalSecurityPolicy.txt
TYPE LocalSecurityPolicy.txt | find /i "ClearTextPassword"


ECHO.
ECHO ■ 결과
TYPE LocalSecurityPolicy.txt | find /i "ClearTextPassword = 1" > NUL
IF ERRORLEVEL 1 ECHO 양호
IF NOT ERRORLEVEL 1 ECHO 취약


DEL LocalSecurityPolicy.txt