@echo off
echo ###################################################################################
echo [W16] 서비스 관리 - IIS 링크 사용금지
echo.

echo ■ 진단 기준
echo    양호 : 심볼릭 링크, aliases, 바로가기 등을 사용하지 않음.
echo    취약 : 심볼릭 링크, aliases, 바로가기 등을 사용함.
echo.
echo.

echo ■ 진단 결과　
set dirPath=%IIS_PATH%

if exist %dirPath% (
    set flag=0

    for /r "%dirPath%" %%G in (*.lnk *.url) do (
        echo %%G
        set flag=1
    )
    rem dir로 파싱하면 파일명을 기준으로 파싱할 수 있기에
    rem 확장자를 기준으로 하기 위해 위 방식 채택

    dir %dirPath% | find "<SYMLINK"
    if not errorlevel 1 (
        set flag=1
    )
    rem 파일은 <SYMLINK>로, 폴더는 <SYMLINKD>로 표시된다

    dir "%dirPath%" | find "<JUNCTION>"
    if not errorlevel 1 (
        set flag=1
    )

    if !flag! EQU 1 (
        echo    → 취약 ^(심볼릭 링크, aliases, 바로가기 등을 사용함^)
        echo.
        echo.
        echo ■ 조치 방안
        echo    Step1^) 제어판 -^> 시스템 및 보안 -^> 관리도구 -^> IIS관리자 -^>
        echo            해당 웹사이트 -^> 기본 설정 -^> "실제 경로"에서 홈 디렉토리 위치 확인
        echo    Step2^) 실제 경로에 입력된 홈 디렉토리로 이동하여 바로가기 파일을 삭제
        call %CHK_FILE% PWN %1
    ) else (
        echo    → 양호 ^(심볼릭 링크, aliases, 바로가기 등을 사용하지 않음^)
        call %CHK_FILE% SAFE %1
    )
) else (
    echo    → 양호 ^(IIS 웹 서비스를 사용하지 않음^)
    call %CHK_FILE% SAFE %1
)

echo.
echo.
