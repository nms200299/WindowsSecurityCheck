@echo off
echo ###################################################################################
echo [W20] 서비스 관리 - IIS 데이터 파일 ACL 적용
echo.

echo ■ 진단 기준
echo 	양호 :  홈 디렉토리 내에 있는 하위 파일들에 대해 Everyone 권한이 존재하지 않음
echo 	취약 :  홈 디렉토리 내에 있는 하위 파일들에 대해 Everyone 권한이 존재
echo.
echo.

icacls "C:\inetpub\wwwroot"

icacls "C:\inetpub\wwwroot" | findstr /I "Everyone" > NUL

echo ■ 진단 결과
if %errorlevel% EQU 0 (
  echo B^|[W-20] 홈 디렉토리 내에 있는 하위 파일들에 대해 Everyone 권한이 존재 - [취약]
  echo.
echo ■ 조치 방안
  echo 시작-실행-INETMGR 입력-사이트 클릭-해당 웹사이트-기본 설정- 홈 디렉토리 실제 경로 확인 
  echo 탐색기를 이용하여 홈 디렉토리의 등록 정보-[보안]탭에서 Everyone 권한 확인 
  echo 불필요한 Everyone 권한을 제거하십시오.
)	else (
	echo B^|[W-20] 홈 디렉토리 내에 있는 하위 파일들에 대해 Everyone 권한이 존재하지 않음 - [양호]
)
echo.
echo.
pause