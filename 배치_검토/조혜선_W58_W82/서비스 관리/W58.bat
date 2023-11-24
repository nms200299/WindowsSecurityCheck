@echo off
echo ###################################################################################
echo [W58] 서비스 관리 - 터미널 서비스 암호화 수준 설정
echo.

echo ■ 진단 기준
echo  양호 : 터미널 서비스를 사용하지 않거나 사용 시 암호화 수준을 “클라이언트와 호환 가능(중간)” 이상으로 설정되어 있음.
echo  취약 : 터미널 서비스를 사용하고 암호화 수준이 “낮음” 으로 설정되어 있음
echo.
echo.

echo ■ 진단 결과
net start | find /I "Remote Desktop Services"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" | find /I "MinEncryptionLevel"
if %errorlevel% EQU 0 (
	echo 	→ 양호 ^(클라이언트와 호환 가능 중간 이상으로 설정됨^)
	call %CHK_FILE% SAFE %1
) else (
	echo 	→ 취약 ^(“낮음” 으로 설정됨^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> GPEDIT.MSC : 로컬 그룹 정책 편집기
	echo 	Step2^) 컴퓨터 구성-^> 관리 템플릿-^> Windows 구성 요소 -^> 터미널 서비스 -^> 원격 데스크톱 세션 호스트 -^> 보안
	echo    Step3^) "클라이언트 연결 암호화 수준 설정" -^> "암호화 수준"을 클라이언트 호환 가능으로 설정
	call %CHK_FILE% PWN %1
)
echo.
echo.