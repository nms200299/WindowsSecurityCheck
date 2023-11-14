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
REM FTP 서버 설정 파일 경로 설정
set "ftpConfigFile=C:\Path\To\Your\FTP\Server\ftp.conf"

REM Anonymous FTP 설정을 확인합니다.
set "anonymousFtpEnabled="
findstr /C:"Anonymous_enable=YES" "!ftpConfigFile!" >nul 2>&1
if %errorlevel% equ 0 (
    set "anonymousFtpEnabled=YES"
) else (
    set "anonymousFtpEnabled=NO"
)

if "!anonymousFtpEnabled!"=="YES" (
    echo Anonymous FTP가 활성화

    REM 취약 상태로 판단하고 조치 방법을 안내
    echo 취약 상태

 echo ■ 조치 방안
    echo 1. FTP 서버 설정 파일을 열고, Anonymous FTP를 비활성화
    echo 2. 필요에 따라 보안 업데이트를 적용합니다.

) else (
    echo Anonymous FTP가 비활성화
    echo  양호
)
echo.
echo.
pause