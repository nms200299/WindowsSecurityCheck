@echo off

REM IIS FTP 사이트 이름 설정
set "siteName=YourFTPSiteName"

REM 접근 제어 설정 (예: 특정 IP 대역 허용)
%SystemRoot%\System32\inetsrv\appcmd set config -section:system.ftpServer/security/ipSecurity /+"[ipAddress='192.168.1.0',subnetMask='255.255.255.0',allowed='True']" /commit:apphost

REM 설정 결과 메시지 출력
if %errorlevel% equ 0 (
    echo FTP 접근 제어가 설정되었습니다.
) else (
    echo FTP 접근 제어 설정 중 오류가 발생했습니다.
)

pause