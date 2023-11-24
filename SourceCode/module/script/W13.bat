@echo off
echo ###################################################################################
echo [W13] 서비스 관리 - IIS 상위 디렉토리 접근 금지
echo.

echo ■ 진단 기준
echo 	양호 :  IIS 상위 디렉토리 접근 금지 설정 존재
echo 	취약 :  IIS 상위 디렉토리 접근 금지 설정 미존재
echo.
echo.

echo ■ 진단 결과
set "filePath=C:\Windows\System32\inetsrv\config\applicationHost.config"
if exist %filePath% (
	type %filePath% | findstr /C:"enableParentPaths=\"true"
	if errorlevel 1 (
	    echo    → 양호 ^(IIS 상위 디렉토리 접근 금지 설정 존재^)
	    call %CHK_FILE% SAFE %1
	) else (
	    echo    → 취약 ^(하나 이상의 웹 사이트에 IIS 상위 디렉토리 접근 허용 설정 존재^)
	    echo.
	    echo.
		 echo ■ 조치 방안
		 echo    Step1^) 제어판 -^> 관리도구 -^> IIS 관리자 -^> 해당 웹사이트 -^> IIS -^> ASP 선택 -^> "부모경로 사용" 항목 "False" 설정 확인
		 call %CHK_FILE% PWN %1
	)
) else (
	echo    → 양호 ^(IIS가 설치되어 있지 않음^)
	call %CHK_FILE% SAFE %1 
)

echo.
echo.
