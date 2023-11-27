@echo off
echo ###################################################################################
echo [W64] 서비스 관리 - HTTP/FTP/SMTP 배너 차단
echo.

echo ■ 진단 기준
echo 	양호 :  HTTP, FTP, SMTP 접속 시 배너 정보가 보이지 않음.
echo 	취약 :  HTTP, FTP, SMTP 접속 시 배너 정보가 보여짐.
echo 	주의 :  프로그램을 통해 판단할 수 없음.
echo.
echo.

echo ■ 진단 결과　
echo 	→ 주의 ^(판단 불가^)
echo.
echo.

echo ■ 조치 방안
echo   - HTTP
echo 	step1^) Microsoft 다운로드 센터에서 UrlScan을 설치
echo 	step2^) IIS 관리자 -^> IIS -^> ISAPI 필터
echo 	step3^) 필터 추가 -^> UrlScan 3.1 - "C:\Windows\System32\inetsrv\urlscan\urlscan.dll"
echo 	step4^) urlcsan.ini 파일^(C:\Windows\System32\inetsrv\urlscan\urlscan.ini^)내 해당 값 변경
echo 	        - RemotesserverHeader=1
echo            - AllowDotInPath=1
echo.
echo   - FTP
echo 	step1^) IIS 관리자 -^> FTP 메시지 -^> 기본 배너 숨기기 설정
echo   - SMTP
echo.
echo 	step1^) IIS 관리자 -^> 서버 개체 우클릭 -^> 메타베이스 직접 편집 허용 설정
echo 	step2^) ^<IIsSmtpServerLocation="/LM/SmtpSvc/1"^>에 ConnectResponse 속성 값을 추가해 SMTP 배너 변경 가능
call %CHK_FILE% WARN %1
echo.
echo.