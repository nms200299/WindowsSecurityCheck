@echo off
echo ###################################################################################
echo [W19] 서비스 관리 - IIS 가상 디렉토리 삭제
echo.

echo ■ 진단 기준
echo    양호 : 해당 웹 사이트에 IIS Admin, IIS Adminpwd 가상 디렉토리가 존재하지 않음.
echo    경고 : 해당 웹 사이트에 IIS Admin, IIS Adminpwd 가상 디렉토리가 존재할 수 있음.
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
echo        시작 -^> 실행 -^> INETMGR 입력 -^> 웹 사이트 -^> IISAdmin, IISAdminpwd 선택 -^> 삭제 
call %CHK_FILE% WARN %1
goto CONTINUE

:SAFE
call %CHK_FILE% SAFE %1

:CONTINUE
echo.
echo.