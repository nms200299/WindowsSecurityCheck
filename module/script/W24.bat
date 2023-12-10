@echo off
echo ###################################################################################
echo [W24] 서비스 관리 - NetBIOS 바인딩 서비스 구동 점검
echo.

echo ■ 진단 기준
echo 	양호 :  TCP/IP와 NetBIOS 간의 바인딩이 제거 되어 있는 경우
echo 	취약 :  TCP/IP와 NetBIOS 간의 바인딩이 제거 되어 있지 않는 경우
echo.
echo.

echo ■ 진단 결과
for /f "delims=" %%a in ('wmic nicconfig where "TcpipNetbiosOptions<>null" get TcpipNetbiosOptions') do (
    echo TcpipNetbiosOptions : %%a | findstr /R "[0-2]"
    if not errorlevel 1 (
        set /a "val=%%a"

        if !val! EQU 2 (
            echo    → 양호 ^(TCP/IP와 NetBIOS 바인딩이 제거됨^)
            call %CHK_FILE% SAFE %1
        ) else (
            echo    → 취약 ^(TCP/IP와 NetBIOS 바인딩이 제거되지 않음^)
            echo.
            echo.
            echo ■ 조치 방안
            echo    시작 -^> 실행 -^> napa.cpl -^> 로컬 영역 연결 -^> TCP/IPv4 속성 -^>
            echo    일반 탭에서 고급 클릭 -^> WINS 탭에서 NetBIOS 사용 안 함 또는 NetBIOS over TCP/IP 사용 안함
            call %CHK_FILE% PWN %1
        )
    )
)

echo.
echo.
