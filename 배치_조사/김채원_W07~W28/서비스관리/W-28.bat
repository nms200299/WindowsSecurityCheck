@echo off
echo ###################################################################################
echo [W28] 서비스 관리 - FTP 접근 제어 설정
echo.

echo ■ 진단 기준
echo 	양호 :  특정 IP 주소에서만 FTP 서버에 접속하도록 접근제어 설정을 적용한 경우
echo 	취약 :  특정 IP 주소에서만 FTP 서버에 접속하도록 접근제어 설정을 적용하지 않은 경우
echo.
echo.

echo ■ 진단 결과　
REM FTP 서버 설정 파일 경로 설정
set "ftpConfigFile=C:\Path\To\Your\FTP\Server\ftp.conf"

REM 접근 제어 설정을 확인합니다.
set "accessControlEnabled="
findstr /C:"AccessControl_enable=YES" "!ftpConfigFile!" >nul 2>&1
if %errorlevel% equ 0 (
    set "accessControlEnabled=YES"
) else (
    set "accessControlEnabled=NO"
)

if "!accessControlEnabled!"=="YES" (
    echo FTP 접근 제어가 비활성화

    echo 취약 상태/ 조치가 필요

	echo ■ 조치 방안
    echo 제어판> 관리도구> IIS 관리> 해당 웹사이트> FTP IPv4 주소 및 도메인 제한

) else (
    echo FTP 접근 제어가 활성화
    echo 양호
)
echo.
echo.
pause