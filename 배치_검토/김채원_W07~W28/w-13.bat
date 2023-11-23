@echo off
echo ###################################################################################
echo [W13] 서비스 관리 - IIS 상위 디렉토리 접근 금지
echo.

echo ■ 진단 기준
echo 	양호 :  IIS 상위 디렉토리 접근 금지 설정이 존재
echo 	취약 :  IIS 상위 디렉토리 접근 금지 설정이 존재 안 함
echo.
echo.

type "C:\inetpub\wwwroot\web.config" | findstr /C:"<requestFiltering allowDoubleEscaping=\"false"

echo %errorlevel% 

    echo 양호: IIS 상위 디렉토리 접근 금지 설정이 존재합니다.
 else 
    echo 취약: IIS 상위 디렉토리 접근 금지 설정이 존재하지 않습니다.


	echo ■ 조치 방안
	echo 	Step1^) 제어판 -^> 관리도구 -^> IIS 관리자 -^> 해당 웹사이트 -^> IIS -^> ASP 선택 -^> "부모경로 사용" 항목 "False" 설정 확인
	call %CHK_FILE% PWN %1

echo.
echo.
pause