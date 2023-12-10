@echo off
echo ###################################################################################
echo [W12] 서비스관리 - IIS CGI 실행 제한
echo.

echo ■ 진단 기준
echo    양호 : 기본 CGI 디렉토리의 Everyone에 모든 권한, 수정, 쓰기 권한 미존재.
echo    취약 : 기본 CGI 디렉토리의 Everyone에 모든 권한, 수정, 쓰기 권한 존재.
echo.
echo.

echo ■ 진단 결과
set "filePath=%IIS_PATH%"

if exist "%filePath%" (
	icacls %filePath% | findstr /C:"Everyone"
	if errorlevel 1 (
    	echo    → 양호 ^(기본 CGI 디렉토리의 Everyone 그룹이 존재하지 않음^)
		goto SAFE
	) else (
		icacls %filePath% | findstr /C:"Everyone" | findstr /C:"F)" >nul
		rem Everyone 그룹에 모든 권한이 있는지 확인
		if errorlevel 1 (
			icacls %filePath% | findstr /C:"Everyone" | findstr /C:"M)" >nul
			rem Everyone 그룹에 수정 권한이 있는지 확인
			if errorlevel 1 (
				icacls %filePath% | findstr /C:"Everyone" | findstr /C:"W)" >nul
				rem Everyone 그룹에 쓰기 권한이 있는지 확인
				if errorlevel 1 (
					echo    → 양호 ^(기본 CGI 디렉토리의 Everyone 그룹 권한이 양호함^)
					goto SAFE
				) else (
					echo    → 취약 ^(기본 CGI 디렉토리 Everyone 그룹에 쓰기 권한이 존재함^)
					goto PWN
				)
			) else (
				echo    → 취약 ^(기본 CGI 디렉토리 Everyone 그룹에 수정 권한이 존재함^)
				goto PWN
			)
		) else (
			echo    → 취약 ^(기본 CGI 디렉토리 Everyone 그룹에 모든 권한이 존재함^)
			goto PWN
		)
	)
) else (
	echo    → 양호 ^(기본 CGI 디렉토리가 존재하지 않음^)
	goto SAFE
)

:PWN
    echo.
    echo.
	echo ■ 조치 방안
	echo 	Step1^) 파일 탐색기 -^> 해당 디렉토리 -^> 속성 -^> 보안
	echo 	Step2^) Everyone의 모든 권한, 수정 권한, 쓰기 권한 제거
	call %CHK_FILE% PWN %1
	goto CONTINUE

:SAFE
    call %CHK_FILE% SAFE %1

:CONTINUE
	echo.
	echo.