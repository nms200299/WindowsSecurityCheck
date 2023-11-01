@echo off

REM IIS 설정 파일 경로
set "configPath=C:\Windows\System32\inetsrv\config\applicationHost.config"

REM Anonymous FTP 액세스를 비활성화
%SystemRoot%\System32\inetsrv\appcmd set config -section:system.ftpServer/security/authentication/anonymousAuthentication /enabled:"False" /commit:apphost

REM 설정 결과 메시지 출력
if %errorlevel% equ 0 (
    echo Anonymous FTP 액세스가 비활성화되었습니다.
) else (
    echo Anonymous FTP 액세스 비활성화 중 오류가 발생했습니다.
)

pause