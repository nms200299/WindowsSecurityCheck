@echo off
echo ###################################################################################
echo [W22] 서비스 관리 - IIS Exec 명령어 쉘 호출 진단
echo.

echo ■ 진단 기준
echo 	양호 :  IIS 5.0 버전에서 해당 레지스트리 값이 0이거나, IIS 6.0 버전 이상.
echo 	경고 :  IIS 5.0 버전에서 해당 레지스트리 값이 1일 수 있음.
echo.
echo.

echo ■ 진단 결과　
for /f "tokens=2 delims=[]" %%A in ('ver') do (
    for /f "tokens=2" %%B in ("%%A") do (
        set "version_number=%%B"
    )
)

echo OS 버전 : %version_number%
for /f "tokens=1-2 delims=." %%a in ("%version_number%") do (
	if %%a LSS 6 (
		echo 3
		if %%a EQU 5 (
			if %%b LSS 2 (
				echo    → 경고 ^(IIS 5.0^(Windows 2000^) 이하 버전임으로 확인이 필요합니다^)
				goto WARN
			) else (
				echo    → 양호 ^(IIS 6.0^(Windows 2003^) 이상 버전 해당 사항 없음^)
				goto SAFE
			)
		) else (
			echo    → 경고 ^(IIS 5.0^(Windows 2000^) 이하 버전임으로 확인이 필요합니다^)
			goto WARN
		)
	) else (
		echo    → 양호 ^(IIS 6.0^(Windows 2003^) 이상 버전 해당 사항 없음^)
		goto SAFE
	)
)

:WARN
echo.
echo.
echo ■ 조치 방안
echo    IIS 5.0^(Windows 2000^) 이하 버전은 아래와 같이 조치.
echo    step 1^) 시작 -^> 실행 -^> REGEDIT -^> HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters 검색
echo    step 2^) DWORD -^> SSIEnableCmdDirective 값을 찾아 값을 "0"으로 입력
call %CHK_FILE% WARN %1
goto CONTINUE

:SAFE
call %CHK_FILE% SAFE %1

:CONTINUE
echo.
echo.