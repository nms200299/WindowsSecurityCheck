@echo off

REM IIS �α� ���� ��� ����
set "logFilePath=C:\inetpub\logs\LogFiles\W3SVC1\u_ex*.log"

REM ��ɾ� ���� ����
echo [��ɾ� ���� ����]

REM ��ɾ� ������ ���� �α� ���� �˻�
for %%f in (%logFilePath%) do (
    echo [����: %%~nxf]
    findstr /i /c:"EXEC" "%%f"
)

REM ��ɾ� ���� ����
echo [��ɾ� ���� ����]

pause