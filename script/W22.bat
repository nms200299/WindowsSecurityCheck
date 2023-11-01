@echo off

REM IIS 로그 파일 경로 설정
set "logFilePath=C:\inetpub\logs\LogFiles\W3SVC1\u_ex*.log"

REM 명령어 추적 시작
echo [명령어 추적 시작]

REM 명령어 추적을 위한 로그 파일 검색
for %%f in (%logFilePath%) do (
    echo [파일: %%~nxf]
    findstr /i /c:"EXEC" "%%f"
)

REM 명령어 추적 종료
echo [명령어 추적 종료]

pause