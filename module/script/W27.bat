@echo off
echo ###################################################################################
echo [W27] 서비스 관리 - Anonymous FTP 금지
echo.

echo ■ 진단 기준
echo 	양호 :  FTP 서비스를 사용하지 않거나, "익명 연결 허용"이 체크되지 않은 경우
echo 	취약 :  FTP 서비스를 사용하거나, "익명 연결 허용"이 체크되어 있는 경우
echo.
echo.

echo ■ 진단 결과
net start | find /i "Microsoft FTP Service"
if errorlevel 1 (
    echo    → 양호 ^(FTP 서비스가 구동 중이지 않음^)
    call %CHK_FILE% SAFE %1
) else (
    type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /C:"<anonymousAuthentication enabled=\"true\" />"
    if errorlevel 1 (
        echo    → 양호 ^(FTP 익명 연결 비허용^)
        call %CHK_FILE% SAFE %1
    ) else (
        echo    → 취약 ^(FTP 익명 연결 허용^)
        echo.
        echo.
        echo ■ 조치 방안
        echo    Step 1^) 제어판 -^> 관리도구 -^> 인터넷 정보 서비스 ^(IIS^) 관리 -^> 해당 웹 사이트 -^> 마우스 우클릭 -^> FTP 게시 추가
        echo    Step 2^) 이후 진행 과정에서 인증 화면의 익명 체크 박스 해제
        call %CHK_FILE% PWN %1
    )
)
echo.
echo.