@echo off
echo ###################################################################################
echo [W02] 계정관리 - Guest 계정 상태
echo.

echo ■ 진단 기준
echo 	양호 : Guest 계정이 비활성화 되어 있음.
echo 	취약 : Guest 계정이 활성화 되어 있음.
echo.
echo.

echo ■ 진단 결과
net user guest | find "활성 계정" | find "예"
if %errorlevel% EQU 0 (
	echo 	→ 취약 ^(Guest 계정이 활성화 됨^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> LUSRMGR.MSC -^> 사용자 -^> GUEST -^> '일반' 탭
	echo 	Step2^) "계정 사용 안 함"에 체크
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(Guest 계정이 활성화 되지 않음^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.