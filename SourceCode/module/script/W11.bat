@echo off
echo ###################################################################################
echo [W11] 서비스 관리 - 디렉토리 리스팅 제거
echo.

echo ■ 진단 기준
echo 	양호 :  "디렉토리 검색" 체크하지 않음.
echo 	취약 :  "디렉토리 검색" 체크함.
echo.
echo.

echo ■ 진단 결과
set "filePath=C:\inetpub\wwwroot\web.config"

if exist "%filePath%" (
    type %filePath% | findstr /i /C:"directoryBrowse enabled=\"true\""
    if errorlevel 1 (
        echo    → 양호 ^(디렉토리 리스팅이 제거됨^)
        call %CHK_FILE% SAFE %1
    ) else (
        echo    → 취약 ^(디렉토리 리스팅이 발견됨^)
        echo.
        echo.
        echo ■ 조치 방안
        echo    제어판^> 관리도구^> IIS관리^> 해당 웹 사이트^> IIS^> "디렉토리 검색" 선택 후 "사용안함" 선택
        call %CHK_FILE% PWN %1
    )
)

if not exist "%filePath%" (
    set "filePath2=C:\Windows\System32\inetsrv\config\applicationHost.config"
    if exist "%filePath2%" (
    type %filePath2% | findstr /i /C:"directoryBrowse enabled=\"true\""
        if errorlevel 1 (
            echo    → 양호 ^(디렉토리 리스팅이 제거됨^)
            call %CHK_FILE% SAFE %1
        ) else (
            echo    → 취약 ^(디렉토리 리스팅이 발견됨^)
            echo.
            echo.
            echo ■ 조치 방안
            echo 제어판^> 관리도구^> IIS관리^> 해당 웹 사이트^> IIS^> "디렉토리 검색" 선택 후 "사용안함" 선택
            call %CHK_FILE% PWN %1
        )
    )

    if not exist "%filePath2%" (
        echo    → 양호 ^(IIS가 설치되어 있지 않음^)
        call %CHK_FILE% SAFE %1 
    )
)


echo.
echo.