@echo off
echo ###################################################################################
echo [W25] 서비스 관리 - FTP 서비스 구동 점검
echo.

echo ■ 진단 기준
echo 	양호 :  FTP 서비스를 사용하지 않는 경우 또는 secure FTP 서비스를 사용하는 경우
echo 	취약 :  FTP 서비스를 사용하는 경우
echo.
echo.

echo ■ 진단 결과　

set "ftpServiceStatus="
for /f "tokens=3*" %%i in ('sc query FTPSVC ^| find "STATE"') do set "ftpServiceStatus=%%j"

if not "!ftpServiceStatus!"=="" (
    echo FTP 서비스가 현재 구동 중

    echo 취약 

echo ■ 조치 방안(
  echo 시작> 실행> services.msc> FTP Publishing Service> 속성> [일반]탭에서 "시작유형"을 "사용안함"으로 설정 후, FTP 서비스 중지
) else (
    echo FTP 서비스가 현재 비활성화
    echo 시스템은 양호
)
echo.
echo.
pause