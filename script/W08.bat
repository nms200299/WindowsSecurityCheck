@echo off

echo [�ϵ� ��ũ �⺻ ���� ����]
echo.

REM �ϵ� ��ũ �⺻ ���� Ȯ��
for /f "tokens=2 delims==" %%C in ('wmic logicaldisk where "drivetype=3" get name^, sharename /format:list ^| findstr /i "name sharename"') do (
    set "driveName=%%C"
    set "shareName=%%D"
    
    REM �⺻ ���� ����
    if not "%shareName%"=="" (
        net share "%shareName%" /delete
        echo %driveName% - %shareName% �⺻ ������ ���ŵǾ����ϴ�.
    )
)

echo.
echo [�۾� �Ϸ�]
echo.

pause