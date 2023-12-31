@echo off
net session >nul 2>&1
if %errorlevel% EQU 2 (
	echo.
	echo 스크립트를 관리자 권한으로 실행해주세요.
	echo 스크립트를 종료합니다.
	echo.
	pause
	exit
) else (
	cd /d %~dp0
	rem 관리자 계정으로 실행시, system32 경로로 작업 디렉터리가 바뀌는 것을 복구해줌.
)


:start
cls
echo __        ___           _                                            
echo \ \      / (_)_ __   __^| ^| _____      _____                          
echo  \ \ /\ / /^| ^| '_ \ / _` ^|/ _ \ \ /\ / / __^|                         
echo   \ V  V / ^| ^| ^| ^| ^| (_^| ^| (_) \ V  V /\__ \                         
echo  __\_/\_/  ^|_^|_^| ^|_^|\__,_^|\___/ \_/\_/ ^|___/___ _               _    
echo / ___^|  ___  ___ _   _ _ __(_) ^|_ _   _   / ___^| ^|__   ___  ___^| ^| __
echo \___ \ / _ \/ __^| ^| ^| ^| '__^| ^| __^| ^| ^| ^| ^| ^|   ^| '_ \ / _ \/ __^| ^|/ /
echo  ___) ^|  __/ (__^| ^|_^| ^| ^|  ^| ^| ^|_^| ^|_^| ^| ^| ^|___^| ^| ^| ^|  __/ (__^|   ^< 
echo ^|____/ \___^|\___^|\__,_^|_^|  ^|_^|\__^|\__, ^|  \____^|_^| ^|_^|\___^|\___^|_^|\_\
echo                                  ^|___/                              
echo                    (중부대학교 취약점진단및평가 02분반 1조 : 주통 팀)
echo.
echo  ______________________________________________________________________________
echo ^| 분 류         ^| 난이도 ^| 항 목	
echo  ------------------------------------------------------------------------------
echo ^| 1. 계정 관리  ^| 상     ^| W01. Administrator 계정 이름 바꾸기
echo ^|               ^| 상     ^| W02. Guest 계정 상태
echo ^| (18개 항목)   ^| 상     ^| W03. 불필요한 계정 제거
echo ^|               ^| 상     ^| W04. 계정 잠금 임계값 설정
echo ^|               ^| 상     ^| W05. 해독 가능한 암호화를 사용하여 암호 저장 해제
echo ^|               ^| 상     ^| W06. 관리자 그룹에 최소한의 사용자 포함
echo ^|               ^|   중   ^| W46. Everyone 사용권한을 익명 사용자에 적용 해제
echo ^|               ^|   중   ^| W47. 계정 잠금 기간 설정
echo ^|               ^|   중   ^| W48. 패스워드 복잡성 설정
echo ^|               ^|   중   ^| W49. 패스워드 최소 암호 길이
echo ^|               ^|   중   ^| W50. 패스워드 최대 사용 기간
echo ^|               ^|   중   ^| W51. 패스워드 최소 사용 기간
echo ^|               ^|   중   ^| W52. 마지막 사용자 이름 표시 안함
echo ^|               ^|   중   ^| W53. 로컬 로그온 허용
echo ^|               ^|   중   ^| W54. 익명 SID/이름 변환 허용 해제
echo ^|               ^|   중   ^| W55. 최근 암호 기억
echo ^|               ^|   중   ^| W56. 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한
echo ^|               ^|   중   ^| W57. 원격터미널 접속 가능한 사용자 그룹 제한
echo  ------------------------------------------------------------------------------
echo ^| 2. 서비스 관리^| 상     ^| W07. 공유 권한 및 사용자 그룹 설정
echo ^|               ^| 상     ^| W08. 하드디스크 기본 공유 제거
echo ^| (36개 항목)   ^| 상     ^| W09. 불필요한 서비스 제거
echo ^|               ^| 상     ^| W10. IIS 서비스 구동 점검
echo ^|               ^| 상     ^| W11. IIS 디렉토리 리스팅 제거
echo ^|               ^| 상     ^| W12. CGI 실행 제한
echo ^|               ^| 상     ^| W13. IIS 상위 디렉토리 접근 금지
echo ^|               ^| 상     ^| W14. 불필요한 파일 제거
echo ^|               ^| 상     ^| W15. 웹프로세스 권한 제한
echo ^|               ^| 상     ^| W16. IIS 링크 사용 금지
echo ^|               ^| 상     ^| W17. IIS 파일 업로드 및 다운로드 제한
echo ^|               ^| 상     ^| W18. IIS DB 연결 취약점 점검
echo ^|               ^| 상     ^| W19. IIS 가상 디렉토리 삭제
echo ^|               ^| 상     ^| W20. IIS 데이터파일 ACL 적용
echo ^|               ^| 상     ^| W21. IIS 미사용 스크립트 매핑 제거
echo ^|               ^| 상     ^| W22. IIS Exec 명령어 쉘 호출 진단
echo ^|               ^| 상     ^| W23. IIS WebDAV 비활성화
echo ^|               ^| 상     ^| W24. NetBIOS 바인딩 서비스 구동 점검
echo ^|               ^| 상     ^| W25. FTP 서비스 구동 점검
echo ^|               ^| 상     ^| W26. FTP 디렉토리 접근 권한 설정
echo ^|               ^| 상     ^| W27. Anonymous FTP 접근 금지
echo ^|               ^| 상     ^| W28. FTP 접근 제어 설정
echo ^|               ^| 상     ^| W29. DNS Zone Transfer 설정
echo ^|               ^| 상     ^| W30. RDS(Remote Data Services) 제거
echo ^|               ^| 상     ^| W31. 최신 서비스팩 적용
echo ^|               ^|   중   ^| W58. 터미널 서비스 암호화 수준 설정
echo ^|               ^|   중   ^| W59. IIS 웹 서비스 정보 숨김
echo ^|               ^|   중   ^| W60. SNMP 서비스 구동 점검
echo ^|               ^|   중   ^| W61. SNMP 서비스 커뮤니티스트링의 복잡성 설정
echo ^|               ^|   중   ^| W62. SNMP Access control 설정
echo ^|               ^|   중   ^| W63. DNS 서비스 구동 점검
echo ^|               ^|     하 ^| W64. HTTP/FTP/SMTP 배너 차단
echo ^|               ^|   중   ^| W65. Telnet 보안 설정
echo ^|               ^|   중   ^| W66. 불필요한 ODBC/OLE-DB 데이터소스와 드라이브 제거
echo ^|               ^|   중   ^| W67. 원격터미널 접속 타임아웃 설정
echo ^|               ^|   중   ^| W68. 예약된 작업에 의심스러운 명령이 등록되어 있는지 점검
echo  ------------------------------------------------------------------------------
echo ^| 3. 패치 관리  ^| 상     ^| W32. 최신 HOT FIX 적용
echo ^|               ^| 상     ^| W33. 백신 프로그램 업데이트
echo ^| (3개 항목)    ^|   중   ^| W69. 정책에 따른 시스템 로깅설정
echo  ------------------------------------------------------------------------------
echo ^| 4. 로그 관리  ^| 상     ^| W34. 로그의 정기적 검토 및 보고
echo ^|               ^| 상     ^| W35. 원격으로 엑세스 할 수 있는 레지스트리 경로
echo ^| (4개 항목)    ^|     하 ^| W70. 이벤트 로그 관리 설정
echo ^|               ^|   중   ^| W71. 원격에서 이벤트 로그파일 접근 차단
echo  ------------------------------------------------------------------------------
echo ^| 5. 보안 관리  ^| 상     ^| W36. 백신 프로그램 설치
echo ^|               ^| 상     ^| W37. SAM 파일 접근 통제 설정
echo ^| (20개 항목)   ^| 상     ^| W38. 화면보호기 설정
echo ^|               ^| 상     ^| W39. 로그온 하지 않고 시스템 종료 허용 해제
echo ^|               ^| 상     ^| W40. 원격 시스템에서 강제로 시스템 종료
echo ^|               ^| 상     ^| W41. 보안감사를 로그할 수 없는 경우 즉시 시스템 종료 해제
echo ^|               ^| 상     ^| W42. SAM 계정과 공유의 익명 열거 허용 안함
echo ^|               ^| 상     ^| W43. Autologin 기능 제어
echo ^|               ^| 상     ^| W44. 이동식 미디어 포맷 및 꺼내기 허용
echo ^|               ^| 상     ^| W45. 디스크 볼륨 암호화 설정
echo ^|               ^|   중   ^| W72. Dos 공격 방어 레지스트리 설정
echo ^|               ^|   중   ^| W73. 사용자가 프린터 드라이버를 설치할 수 없게 함
echo ^|               ^|   중   ^| W74. 세션 연결을 중단하기 전에 필요한 유휴시간
echo ^|               ^|     하 ^| W75. 경고 메시지 설정
echo ^|               ^|   중   ^| W76. 사용자별 홈 디렉토리 권한 설정
echo ^|               ^|   중   ^| W77. LAN Manager 인증 수준
echo ^|               ^|   중   ^| W78. 보안 채널 데이터 디지털 암호화 또는 서명
echo ^|               ^|   중   ^| W79. 파일 및 디렉토리 보호
echo ^|               ^|   중   ^| W80. 컴퓨터 계정 암호 최대 사용 기간
echo ^|               ^|   중   ^| W81. 시작 프로그램 목록 분석
echo  ------------------------------------------------------------------------------
echo ^| 6. DB 관리    ^| 상     ^| W82. Windows 인증 모드 사용
echo ^|               ^|        ^|
echo ^| (1개 항목)    ^|        ^|
echo  ------------------------------------------------------------------------------
echo Usage : W[nn] = 개별 진단 (ex. W01)
echo         [1~6] = 항목 진단 (ex. 1)
echo         ALL   = 전체 진단
echo         EXIT  = 프로그램 종료
echo  ------------------------------------------------------------------------------

set "TMP_PATH=.\module\tmp"
set "SCR_PATH=.\module\script"

del /F /Q "%TMP_PATH%\*" > NUL
rem 임시로 생성한 정책 및 설정 파일을 모두 강제로(/F) 묻지 않고(/Q) 지워버린다.

set "choice="
rem 입력 값에 빈 값이 왔을 때, 이전 값을 사용하는 것을 막기 위해 초기화.
set /p choice=input : 
setlocal enabledelayedexpansion

echo.
if "%choice%" == "" (
	echo Syntax Error!
	pause
	goto start
)
rem 입력 값에 빈 값이 오면 에러 출력 후, 되돌아감.

set "logFileName=%date%_%time%.log"
set "logFileName=!logFileName::=.!"
rem 지연된 확장 변수 문법으로 :을 .으로 대체
rem (파일 이름으로 :은 사용할 수 없음)
set "logFileName=!logFileName: =0!"
rem 지연된 확장 변수 문법으로 공백을 0으로 대체
rem (n을 nn형식으로 변환)

echo 0 > "%TMP_PATH%\CHK_TOTAL_CNT"
echo 0 > "%TMP_PATH%\CHK_SAFE_CNT"
echo 0 > "%TMP_PATH%\CHK_WARN_CNT"
echo 0 > "%TMP_PATH%\CHK_PWN_CNT"
set "CHK_FILE=.\module\mod_cntChkState.bat"

for /F %%a in (./FTP_PATH.txt) do (
	set "FTP_PATH=%%a"
)
for /F %%a in (./IIS_PATH.txt) do (
	set "IIS_PATH=%%a"
)

if "%choice:~0,1%" == "W" (
rem 입력 값 맨 앞 문자가 W이면 [개별 진단]을 의미함.
	if "%choice:~2,1%" == "" (
		set "choice=W0%choice:~1,1%"
		rem 항목 번호가 nn이 아닌 n 형식인 경우('W1'), nn 형식('W01')으로 수정함.
	)

	if NOT EXIST "%SCR_PATH%\!choice!.bat" (
		echo Not found script file.
		pause
		goto start
	)

	call %CHK_FILE% TOTAL
	echo @ !choice! 개별 진단 > ".\log\%logFileName%"
	call "%SCR_PATH%\!choice!.bat" !choice! >> ".\log\%logFileName%"
	rem 진단 스크립트를 실행하고, log 파일로 저장
	type ".\log\%logFileName%"
	rem 저장된 log 파일을 출력

) else (
	if /i %choice% == ALL (
		for /L %%A in (1,1,9) do (
			call %CHK_FILE% TOTAL
			call "%SCR_PATH%\W0%%A.bat" %%A > "%TMP_PATH%\LOG_TEMP"
			rem 진단 스크립트를 실행하고, LOG_TEMP 파일로 저장
			type "%TMP_PATH%\LOG_TEMP"
			type "%TMP_PATH%\LOG_TEMP" >> ".\log\%logFileName%"
			rem LOG_TEMP 파일을 출력하고, log 파일로 병합 
		)
		for /L %%A in (10,1,68) do (
			call %CHK_FILE% TOTAL
			call "%SCR_PATH%\W%%A.bat" %%A > "%TMP_PATH%\LOG_TEMP"
			rem 진단 스크립트를 실행하고, LOG_TEMP 파일로 저장
			type "%TMP_PATH%\LOG_TEMP"
			type "%TMP_PATH%\LOG_TEMP" >> ".\log\%logFileName%"
			rem LOG_TEMP 파일을 출력하고, log 파일로 병합 
		)
	) else (

		if /i %choice% == EXIT (
			exit
			rem 입력 값이 EXIT면, 배치 파일을 종료함.
		) else (

			if %choice% GEQ 1 (
				if %choice% LEQ 6 (
					rem 입력 값이 1~6이면 [항목 진단]을 의미함.
					echo @ !choice!번 항목 진단 > ".\log\%logFileName%"
					for /f "tokens=*" %%A in (.\module\schedule\%choice%.txt) do (
						call %CHK_FILE% TOTAL
						call "%SCR_PATH%\%%A.bat" %%A > "%TMP_PATH%\LOG_TEMP"
						rem 진단 스크립트를 실행하고, LOG_TEMP 파일로 저장
						type "%TMP_PATH%\LOG_TEMP"
						type "%TMP_PATH%\LOG_TEMP" >> ".\log\%logFileName%"
						rem LOG_TEMP 파일을 출력하고, log 파일로 병합 
					)
				) else (
					echo Syntax Error!
					goto start
				)
			) else (
				echo Syntax Error!
				goto start
			)
			rem 입력 값이 1~6이면 항목 진단을 수행하고,
			rem 아니면 문법에러 메시지를 띄운다.
		)
	)
)

call .\module\mod_cntChkPrint.bat > %TMP_PATH%\LOG_TEMP
rem 점검 결과를 출력하는 배치파일을 호출한다.

type "%TMP_PATH%\LOG_TEMP"
type "%TMP_PATH%\LOG_TEMP" >> .\log\%logFileName%
rem LOG_TEMP 파일을 출력하고, log 파일로 병합 

del /F /Q "%TMP_PATH%\*" > NUL
rem 임시로 생성한 정책 및 설정 파일을 모두 강제로(/F) 묻지 않고(/Q) 지워버린다.
pause
endlocal
goto start
