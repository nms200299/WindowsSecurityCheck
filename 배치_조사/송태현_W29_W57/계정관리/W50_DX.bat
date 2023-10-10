@ECHO OFF
 
ECHO ■ 기준
ECHO 양호 : "최대 암호 사용 기간"이 “90일” 이하로 설정되어 있는 경우
ECHO 취약 : "최대 암호 사용 기간”이 설정되지 않았거나 “90일”을 초과하는 값으로 설정된 경우
 
ECHO.
ECHO ■ 현황
secedit /EXPORT /CFG LocalSecurityPolicy.txt
TYPE LocalSecurityPolicy.txt | find /i "MaximumPasswordAge" | find /v "\"
 
ECHO.
ECHO ■ 결과
TYPE LocalSecurityPolicy.txt | find "MaximumPasswordAge =" > passwd.txt
FOR /f "tokens=1-3" %%a IN (passwd.txt) DO SET passwd_maxage=%%c
IF %passwd_maxage% LEQ 90 ECHO 양호
IF NOT %passwd_maxage% LEQ 90 ECHO 취약
 
DEL LocalSecurityPolicy.txt
DEL passwd.txt