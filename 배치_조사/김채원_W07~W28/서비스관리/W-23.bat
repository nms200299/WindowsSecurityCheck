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
set "webDavModuleStatus="
for /f "tokens=3*" %%i in ('%SystemRoot%\System32\inetsrv\appcmd.exe list module ^| find "WebDAVModule"') do set "webDavModuleStatus=%%j"

if not "!webDavModuleStatus!"=="" (
    echo WebDAV 모듈이 활성화되어 있습니다.

    echo 취약 상태입니다. 조치가 필요

echo ■ 조치 방안
    echo 1. IIS 관리자를 열고, 웹 사이트 또는 가상 디렉터리를 선택
    echo 2. "모듈"을 더블 클릭하고, "WebDAV 모듈"을 선택하여 비활성화
    echo 3. 보안 업데이트를 적용

) else (
    echo WebDAV 모듈이 비활성화되어 있dma.
    echo 시스템은 안전한 상태
)
echo.
echo.
pause