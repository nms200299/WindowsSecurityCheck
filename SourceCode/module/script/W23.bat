@echo off
echo ###################################################################################
echo [W23] 서비스 관리 - IIS WebDAV 비활성화
echo.

echo ■ 진단 기준
echo 	양호 :  1. IIS 서비스를 사용하지 않는 경우
echo			2. DisableWebDAV 값이 1로 설정되어 있는 경우
echo			3. Windows NT, 2000은 서비스팩 4 이상이 설치되어 있는 경우
echo			4. Windows 2003, Windows 2008은 WebDAV가 금지 되어 있는 경우
echo 	취약 :  양호 기준에 한 가지라도 해당하지 않는 경우(2003, 2008은 1,4번만)
echo.
echo.

echo ■ 진단 결과
set filePath=C:\Windows\System32\inetsrv\config\applicationHost.config
if exist %filePath% (
    type %filePath% | findstr /C:"\webdav.dll\" allowed=\"true\""
    if errorlevel 1 (
        echo    → 양호 ^(WebDAV가 비활성화되어 있거나 삭제됨^)
        call %CHK_FILE% SAFE %1
    ) else (
        echo    → 취약 ^(WebDAV가 활성화됨^)
        echo.
        echo.
        echo ■ 조치 방안
        echo    인터넷 정보 서비스^(IIS^) 관리자 -^> 서버 선택 -^> IIS -^> ISAPI 및 CGI 제한 선택, WebDAV 사용여부 확인 ^(허용됨일 경우 취약^)
        call %CHK_FILE% PWN %1
    )

) else (
        echo    → 양호 ^(IIS를 사용하지 않음^)
        call %CHK_FILE% SAFE 
)

echo.
echo.