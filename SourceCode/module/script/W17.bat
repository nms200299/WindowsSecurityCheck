@echo off
echo ###################################################################################
echo [W17] 서비스 관리 - IIS 파일 업로드 및 다운로드 제한
echo.

echo ■ 진단 기준
echo    양호 : 웹 프로세스의 서버 자원 관리를 위해 업로드 및 다운로드 용량을 제한함
echo    취약 : 웹 프로세스의 서버 자원 관리하지 않음 ^(업로드 및 다운로드 용량 미제한^)
echo.
echo.

echo ■ 진단 결과　
set dirPath=C:\inetpub\wwwroot
set flag=0
if exist %dirPath%\web.config (
	type %dirPath%\web.config | findstr /C:"maxAllowedContentLength=" >nul
	if errorlevel 1 (
		echo    → 취약 ^(web.config 파일에 maxAllowedContentLength 설정이 없음^)
		set flag=1
	)
) else (
	echo    → 취약 ^(루트 디렉토리 하위에 web.config 파일이 존재하지 않음^)
	set flag=1
)

type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /C:"bufferingLimit="  >nul
if errorlevel 1 (
	echo    → 취약 ^(applicationHost.config 파일에 bufferingLimit 설정이 없음^)
	set flag=1
)

type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /C:"maxRequestEntityAllowed="  >nul
if errorlevel 1 (
	echo    → 취약 ^(applicationHost.config 파일에 maxRequestEntityAllowed 설정이 없음^)
	set flag=1
)


if !flag! EQU 1 (
	echo.
	echo.
    echo ■ 조치 방안
    echo    Step1^) 웹 사이트의 루트 디렉토리의 web.config 파일 내 아래 항목 추가 ^(없으면 새로 생성^)
    echo             ^<configuration^>
    echo               ^<system.webServer^>
	echo                 ^<security^>
	echo                   ^<requestFiltering^>
	echo                     ^<requestLimits maxAllowedContentLength="콘텐츠 용량" /^>
	echo                   ^</requestFiltering^>
	echo                 ^</security^>
    echo               ^</system.webServer^>
    echo             ^</configuration^>
    echo    Step2^) ^%systemroot^%\System32\inetsrv\config\applicationHost.config 파일 내 아래 항목 추가
    echo             ^<system.webServer^>
    echo               ^<asp^>
    echo                 ^<limits bufferingLimit="파일 다운로드 용량" maxRequestEntityAllowed="파일 업로드 용량" /^>
    echo               ^</asp^>
    echo             ^</system.webServer^>
    echo    ※ Default 설정 값
    echo             ^(1^) maxAllowedContentLength ^(콘텐츠 용량^) : Default: 30MB
    echo             ^(2^) maxRequestEntityAllowed ^(파일 업로드 용량^) : Default: 200000
    echo             ^(3^) bufferingLimit ^(파일 다운로드 용량^) : Default: 4MB
    call %CHK_FILE% PWN %1
) else (
	echo    → 양호 ^(업로드 및 다운로드 용량을 제한함^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.