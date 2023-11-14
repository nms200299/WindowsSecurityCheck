@echo off
echo ###################################################################################
echo [W12] 서비스관리 - IIS CGI 실행 제한
echo.

echo ■ 진단 기준
echo 	양호 :IIS CGI 실행 제한을 하는 scripts 파일이 존재하지 않습니다.
echo 	취약 :IIS CGI 실행 제한을 하는 scripts 파일이 존재합니다.

echo ■ 진단 결과
if exist "C:\inetpub\wwwroot\scripts.file" (
    echo 취약: IIS CGI 실행 제한을 하는 scripts 파일이 존재합니다.
		echo ■ 조치 방안
	echo 	Step1^) 탐색기> 해당 디렉토리> 속성> 보안
	echo 	Step2^) Everyone의 모든 권한,수정 권한, 쓰기 권한 제거

) else (
    echo 양호: IIS CGI 실행 제한을 하는 scripts 파일이 존재하지 않습니다.
)
	
pause
