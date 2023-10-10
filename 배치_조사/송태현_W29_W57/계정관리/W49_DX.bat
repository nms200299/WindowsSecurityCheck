@ECHO OFF
 
ECHO ■ 기준
ECHO 양호 : "최소 암호 길이"가 "8문자" 이상으로 설정되어 있는 경우
ECHO 취약 : "최소 암호 길이"가 설정되지 않았거나 "8문자" 미만으로 설정되어 있는 경우
 
ECHO.
ECHO ■ 현황
secedit /EXPORT /CFG LocalSecurityPolicy.txt
TYPE LocalSecurityPolicy.txt | find /i "MinimumPasswordLength"
 
ECHO.
ECHO ■ 결과
TYPE LocalSecurityPolicy.txt | find "MinimumPasswordLength =" > passwd.txt
FOR /f "tokens=1-3" %%a IN (passwd.txt) DO SET passwd_length=%%c
IF %passwd_length% GEQ 8 ECHO 양호
IF NOT %passwd_length% GEQ 8 ECHO 취약
 
DEL LocalSecurityPolicy.txt
DEL passwd.txt