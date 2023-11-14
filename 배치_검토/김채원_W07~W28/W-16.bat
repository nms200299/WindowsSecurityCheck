@echo off
echo ###################################################################################
echo [W16] 서비스 관리 - IIS 링크 사용 금지
echo.

echo ■ 진단 기준
echo 심볼릭 링크, aliases, 바로가기 등의 사용을 허용함 - [취약]
echo 심볼릭 링크, aliases, 바로가기 등의 사용을 허용하지 않음 - [양호]

echo ■ 진단 결과　
set file=C:\inetpub\wwwroot
set flag=0
for /r "%file%" %%G in (*.htm *.url *.html) do (
    echo %%G
    set flag=1
)
if !flag! EQU 1 (
    echo  심볼릭 링크, aliases, 바로가기 등의 사용을 허용함 - [취약]
    echo ■ 조치 방안
    echo  등록된 웹 사이트의 홈 디렉토리에 있는 심볼릭 링크, aliases, 바로가기 파일을 삭제하십시오.
    echo 제어판-시스템 및 보안-관리도구-IIS관리자-해당 웹사이트-기본 설정-"실제 경로"에서 홈 디렉토리 위치 확인
    echo 실제 경로에 입력된 홈 디렉토리로 이동하여 바로가기 파일을 삭제
) else (
    echo B^| 심볼릭 링크, aliases, 바로가기 등의 사용을 허용하지 않음 - [양호]
)
echo.
echo.
pause