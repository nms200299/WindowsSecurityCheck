@echo off
echo ###################################################################################
echo [W21] 서비스 관리 - IIS 미사용 스크립트 매핑 제거
echo.

echo ■ 진단 기준
echo 	양호 :  취약한 매핑이 존재하지 않음.
echo 	취약 :  취약한 매핑이 존재함.
echo.
echo.

echo ■ 진단 결과　
set "configPath=C:\Windows\System32\inetsrv\config\applicationHost.config"
set "filePath=C:\inetpub\wwwroot"
set "subModPath=.\module\script\W21-1.bat"
set "flag=0"
call %subModPath% .htr
call %subModPath% .idc
call %subModPath% .shtm
call %subModPath% .stm
call %subModPath% .printer
call %subModPath% .ida
call %subModPath% .idq
call %subModPath% .htw
rem 1. 각 취약한 전역 설정별로 지역 설정에서 지워진게 있는지 검증
rem 2. 각 지역 설정에서 추가된 취약한 설정이 없는지 검증
if !flag! EQU 1 (
    echo    → 취약 ^(취약한 매핑이 조치되지 않음^)
    echo.
    echo.
    echo ■ 조치 방안
    echo    step 1^) 시작 -^> 실행 -^> INETMGR -^> 웹 사이트 -^> 해당 웹사이트 -^> 기본 설정 -^> 처리기 매핑 선택
    echo    step 2^) 취약한 매핑 제거 ^(.htr, .idc, .shtm, .shtml, .printer, .htw, .ida, .idq^)
    call %CHK_FILE% PWN %1
) else (
    echo    → 양호 ^(취약한 매핑이 발견되지 않았거나, 조치됨^)
    call %CHK_FILE% SAFE %1
)
echo.
echo.