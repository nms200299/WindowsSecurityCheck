@echo off
echo ###################################################################################
echo [W24] ���� ���� - NetBIOS ���ε� ���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  TCP/IP�� NetBIOS ���� ���ε��� ���� �Ǿ� �ִ� ���
echo 	��� :  TCP/IP�� NetBIOS ���� ���ε��� ���� �Ǿ� ���� �ʴ� ���
echo.
echo.

echo �� ���� ���
for /f "delims=" %%a in ('wmic nicconfig where "TcpipNetbiosOptions<>null" get TcpipNetbiosOptions') do (
    echo TcpipNetbiosOptions : %%a | findstr /R "[0-2]"
    if not errorlevel 1 (
        set /a "val=%%a"

        if !val! EQU 2 (
            echo    �� ��ȣ ^(TCP/IP�� NetBIOS ���ε��� ���ŵ�^)
            call %CHK_FILE% SAFE %1
        ) else (
            echo    �� ��� ^(TCP/IP�� NetBIOS ���ε��� ���ŵ��� ����^)
            echo.
            echo.
            echo �� ��ġ ���
            echo    ���� -^> ���� -^> napa.cpl -^> ���� ���� ���� -^> TCP/IPv4 �Ӽ� -^>
            echo    �Ϲ� �ǿ��� ��� Ŭ�� -^> WINS �ǿ��� NetBIOS ��� �� �� �Ǵ� NetBIOS over TCP/IP ��� ����
            call %CHK_FILE% PWN %1
        )
    )
)

echo.
echo.
