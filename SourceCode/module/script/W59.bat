@echo off
echo ###################################################################################
echo [W59] 서비스 관리 - IIS 웹 서비스 정보 숨김
echo.

echo ■ 진단 기준
echo 	양호 :  웹 서비스 에러 페이지가 별도로 지정되어 있음.
echo 	취약 :  웹 서비스 에러 페이지가 별도로 지정되지 않아 에러 발생 시 중요 정보 가 노출되어 있음.
echo.
echo.

echo ■ 진단 결과　
set filePath=C:\inetpub\wwwroot
set flag=0

type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /I /C:"httpErrors errorMode=\"Custom"
if errorlevel 1 (
	type %filePath%\web.config | findstr /I /C:"httpErrors errorMode=\"Custom"
	if errorlevel 1 (
		echo    → 취약 ^(웹 서비스 에러 페이지가 별도로 지정되지 않음^)
		echo.
		echo.
		echo ■ 조치 방안
		echo 	Step1^) 제어 -^> 관리 도구 -^> IIS'인터넷 정보 서비스' 관리자 -^> 해당 웹 사이트
		echo        -^> '오류 페이지' -^> '작업' 탭에서 '기능 설정 편집' -^> “서버 오류 발생 시 다음 반환“ 항목을 ”사용자 지정 오류 페이지“로 설정
		call %CHK_FILE% PWN %1
	) else (
		echo    → 양호 ^(지역 설정에서 웹 서비스 에러 페이지가 별도로 지정되어 있음^)
		call %CHK_FILE% SAFE %1
	)
) else (
	echo    → 양호 ^(전역 설정에서 웹 서비스 에러 페이지가 별도로 지정되어 있음^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.
