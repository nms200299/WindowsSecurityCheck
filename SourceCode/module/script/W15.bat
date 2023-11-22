@echo off
echo ###################################################################################
echo [W15] 서비스 관리 - 웹 프로세스 권한 제한
echo.

echo ■ 진단 기준
echo    양호 : 웹 프로세스가 웹 서비스 운영에 필요한 최소한 권한으로 설정되어 있음.
echo    취약 : 웹 프로세스가 관리자 권한이 부여된 계정으로 구동되고 있음.
echo    경고 : nobody 계정외, 다른 계정으로 운용되는 경우 직접 확인이 필요함.
echo.
echo.

echo ■ 진단 결과
if exist "C:\inetpub\" (
	net user | findstr /C:"nobody" > nul
	if errorlevel 1 (
		echo    → 경고 ^(nobody 계정이 존재하지 않음^)
		goto WARN
	) else (
		icacls "C:\inetpub" | findstr /C:"nobody"
		if errorlevel 1 (
			echo    → 경고 ^(웹 프로세스가 nobody 계정으로 구동되고 있지 않음^)
			goto WARN
		) else (
			echo    → 양호 ^(웹 서비스 운영에 필요한 최소한 권한으로 설정되어 있음^)
			goto SAFE
		)
	)
) else (
	echo    → 양호 ^(웹 서버 디렉토리가 존재하지 않음^)
	goto SAFE
)

:WARN
	echo.
	echo.
	echo ■ 조치 방안
	echo    1. 시작 -^> 제어판 -^> 관리도구 -^> 컴퓨터 관리 -^> 로컬 사용자 및 그룹 -^> 사용자 선택 -^> nobody 계정 추가 
	echo    2. 시작 -^> 제어판 -^> 관리도구 -^> 로컬 보안 정책 -^> 사용자 권한 할당 선택, " 서비스 로그온" 에 "nobody" 계정 추가
	echo    3. 시작 -^> 실행 -^> SERVICES.MSC -^> IIS Admin Service -^> 속성 -^> [로그온] 탭의 계정 지정에 nobody 계정 및 패스워드
	echo    4. 시작 -^> 프로그램 -^> 윈도우 탐색기 -^> IIS가 설치된 폴더 속성 -^> [보안] 탭에서 nobody 계정을 추가하고 모든 권한 체크
	call %CHK_FILE% WARN %1
	goto CONTINUE

:SAFE
    call %CHK_FILE% SAFE %1

:CONTINUE
	echo.
	echo.
