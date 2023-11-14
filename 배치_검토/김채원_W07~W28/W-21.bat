@echo off
echo ###################################################################################
echo [W21] 서비스 관리 - IIS 미사용 스크립트 매핑 제거
echo.

echo ■ 진단 기준
echo 	양호 :  취약한 매핑이 존재하지 않는 경우
echo 	취약 :  취약한 매핑이 존재하는 경우
echo.
echo.

echo ■ 진단 결과　

set "scriptMapping=C:\Windows\System32\inetsrv\config\schema\ScriptMap_4.0_0_0"
if exist "!scriptMapping!" (
    echo 현재 IIS 미사용 스크립트 매핑 정보를 찾았습니다.

    REM 매핑 정보를 출력합니다.
    type "!scriptMapping!"

echo 	취약 :  취약한 매핑이 존재하는 경우

    REM 조치 방법 안내
	echo ■ 조치 방안
    echo 1. IIS 관리자를 열고, 해당 매핑을 확인하고 제거합니다.
    echo 2. 보안 업데이트 및 권장 설정을 적용합니다.

) else (
echo 	양호 :  취약한 매핑이 존재하지 않음
)
echo.
echo.
pause