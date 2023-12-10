@echo off
echo ###################################################################################
echo [W25] 서비스 관리 - FTP 서비스 구동 점검
echo.

echo ■ 진단 기준
echo 	양호 :  FTP 서비스를 사용하지 않는 경우 또는 secure FTP 서비스를 사용하는 경우
echo 	취약 :  FTP 서비스를 사용하는 경우
echo.
echo.

echo ■ 진단 결과　
net start | find /i "Microsoft FTP Service"
if errorlevel 1 (
    echo    → 양호 ^(FTP 서비스가 구동 중이지 않음^)
    call %CHK_FILE% SAFE %1
) else (
    echo    → 취약 ^(FTP 서비스가 구동 중임^)
    echo.
    echo.
    echo ■ 조치 방안
    echo    시작 -^> 실행 -^> SERVICES.MSC -^> FTP Publishing Service 또는 Microsoft FTP Service 선택
    echo    속성 -^> ^[일반^] 탭에서 "시작 유형"을 "사용 안 함"으로 설정한 후, FTP 서비스 중지 
    call %CHK_FILE% PWN %1
)
echo.
echo.