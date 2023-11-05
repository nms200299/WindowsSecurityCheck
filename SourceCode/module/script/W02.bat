@ECHO OFF

ECHO 기준
ECHO 양호 : Guest 계정이 비활성화 되어 있는 경우
ECHO 취약 : Guest 계정이 활성화 되어 있는 경우

ECHO.
ECHO 현황
net user guest > NUL
IF NOT ERRORLEVEL 1 net user guest | find "활성 계정"

EHCO.
EHCO 결과
net user guest | find "활성 계정" | find "예" > NUL
IF ERRORLEVEL 1 ECHO 양호
IF NOT ERRORLEVEL 1 ECHO 취약

pause