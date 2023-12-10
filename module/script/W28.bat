@echo off
echo ###################################################################################
echo [W28] 서비스 관리 - FTP 접근 제어 설정
echo.

echo ■ 진단 기준
echo 	양호 :  특정 IP 주소에서만 FTP 서버에 접속하도록 접근제어 설정을 적용함
echo 	취약 :  특정 IP 주소에서만 FTP 서버에 접속하도록 접근제어 설정을 적용하지 않음
echo.
echo.

echo ■ 진단 결과　
type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /I /C:"binding protocol=\"ftp\""
if not errorlevel 1 (
    rem FTP 서비스가 바인딩 된 경우,
    type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /I /C:"<ipSecurity allowUnlisted=\"false"
    if errorlevel 1 (
        echo    → 취약 ^(지정된 IP만 FTP 서버에 접속하도록 설정되지 않음^)
        echo      ^(지정된 IP가 있더라도, 지정되지 않은 클라이언트에 대한 엑세스 거부가 설정되지 않으면 취약 -^> step3 참고^)
        echo.
        echo.
        echo ■ 조치 방안
        echo step 1^) 제어판 -^> 관리도구 -^> 인터넷 정보 서비스 ^(IIS^) 관리 -^> 해당 웹 사이트 -^> FTP IPv4 주소 및 도메인 제함
        echo step 2^) ^[작업^]의 허용 항목 추가에서 FTP 접속을 허용할 IP 입력
        echo step 3^) ^[작업^]의 기능 설정 편집에서 지정되지 않은 클라이언트에 대한 엑세스를 거부 선택
        call %CHK_FILE% PWN %1
    ) else (
        echo    → 양호 ^(특정 IP만 FTP 서버에 접속하도록 설정됨^)
        call %CHK_FILE% SAFE %1
    )
) else (
    echo    → 양호 ^(FTP 서비스가 바인딩 되지 않음^)
    call %CHK_FILE% SAFE %1
)

echo.
echo.