@echo off
echo ###################################################################################
echo [W37] 보안 관리 - SAM 파일 접근 통제 설정
echo.

echo ■ 진단 기준
echo 	양호 : SAM 파일 접근권한에 Administrator, System 그룹만 모든 권한으로 설정되어 있는 경우
echo 	취약 : SAM 파일 접근권한에 Administrator, System 그룹 외 다른 그룹에 권한이 설정되어 있는 경우
echo.
echo.

echo ■ 진단 결과
icacls %systemroot%\system32\config\SAM | findstr /V /C:"SYSTEM" /C:"Administrator" /C:"NT AUTHORITY\SYSTEM" /C:"BUILTIN\Administrators" | FIND ":(F)"
if %errorlevel% EQU 0 (
	echo 	→ 취약 ^(SAM 파일 접근권한에 Administrator, System 그룹만 모든 권한으로 설정되어 있는 경우^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) %systemroot%\system32\config\SAM -^> 속성 -^> 보안
	echo 	Step2^) Administratirm system 그룹 외 다른 사용자 및 그룹 권한 제거
	call %CHK_FILE% PWN %1
) else (
	echo 	→ 양호 ^(SAM 파일 접근권한에 Administrator, System 그룹 외 다른 그룹에 권한이 설정되어 있는 경우^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.

