@ECHO OFF
 
ECHO ■ 기준
ECHO 양호 : "최소 암호 사용 기간"이 0보다 큰 값으로 설정되어 있는 경우
ECHO 취약 : "최소 암호 사용 기간"이 0으로 설정되어 있는 경우
 
ECHO.
ECHO ■ 현황
secedit /EXPORT /CFG LocalSecurityPolicy.txt
TYPE LocalSecurityPolicy.txt | find /i "MinimumPasswordAge"
 
ECHO.
ECHO ■ 결과
TYPE LocalSecurityPolicy.txt | find "MinimumPasswordAge =" > passwd.txt
FOR /f "tokens=1-3" %%a IN (passwd.txt) DO SET passwd_minage=%%c
IF %passwd_minage% GEQ 1 ECHO 양호
IF NOT %passwd_minage% GEQ 1 ECHO 취약
 
DEL LocalSecurityPolicy.txt
DEL passwd.txt