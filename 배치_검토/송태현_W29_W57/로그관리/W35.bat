@echo off
echo ###################################################################################
echo [W35] 원격으로 액세스 할 수 있는 레지스트리 경로
echo.

echo ■ 진단 기준
echo 	양호 : Remote Registry Service가 중지되어 있는 경우
echo 	취약 : Remote Registry Service가 사용 중인 경우
echo.
echo.

echo ■ 진단 결과
net start | find /I "Remote Registry" > nul
if %errorlevel% EQU 0 (
	echo 	→ 취약 ^(Remote Registry Service가 사용 중^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SERVICES.MSC -^> Remote Registry -^> 속성
	echo 	Step2^) 시작 유형 -^> 사용 안함
	echo 	Step3^) 서비스 상태 -^> 중지
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(Remote Registry Service가 중지됨^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.