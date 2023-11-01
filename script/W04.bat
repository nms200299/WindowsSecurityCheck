@ECHO OFF

 

ECHO ■ 기준

ECHO 양호 : 계정 잠금 임계값이 5 이하의 값으로 설정되어 있는 경우

ECHO 취약 : 계정 잠금 임계값이 6 이상의 값으로 설정되어 있는 경우

 

ECHO.

ECHO ■ 현황

net accounts | findstr /I /C:"잠금 임계값"

 

ECHO.

ECHO ■ 결과

net accounts | findstr /I /C:"잠금 임계값" > 1-04-Threshold.txt

FOR /f "tokens=1-3" %%a IN (1-04-Threshold.txt) DO SET Threshold=%%c

IF %Threshold% LEQ 5 ECHO 양호

IF NOT %Threshold% LEQ 5 ECHO 취약

 

DEL 1-04-Threshold.txt