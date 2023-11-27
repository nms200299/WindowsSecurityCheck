@echo off
echo ###################################################################################
echo [W67] 서비스 관리 - 원격터미널 접속 타임아웃 설정
echo.

echo ■ 진단 기준
echo 	양호 : 원격제어 시 Timeout 제어 설정을 적용함.
echo 	취약 : 원격제어 시 Timeout 제어 설정을 적용하지 않음.
echo.
echo.

echo ■ 진단 결과
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" | findstr /I /C:"MaxIdleTime"
if errorlevel 1 (
	echo 	→ 취약 ^(원격제어 시 Timeout 제어 설정을 적용하지 않음.^)
	echo.
	echo.
    echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> GPEDIT.MSC'로컬 그룹 정책 편집기'
    echo    Step2^) 컴퓨터 구성 -^> 관리 템플릿 -^> Windows 구성 요소 -^> 터미널 서비스 -^> 원격 데스크톱 -^> 세션 호스트 -^> 세션 시간 제한
    echo    Step3^) '활성 상태지만 유휴 터미널 서비스 세션에 시간제한 설정' -^> '유휴 세션 제한'을 30분으로 설정
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(원격제어 시 Timeout 제어 설정을 적용함.^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.
