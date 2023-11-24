@echo off
echo ###################################################################################
echo [W43] 보안 관리 - Autologon 기능 제어
echo.

echo ■ 진단 기준
echo 	양호 : AutoAdminLogon 값이 없거나 0으로 설정되어 있는 경우
echo 	취약 : AutoAdminLogon 값이 1로 설정되어 있는 경우
echo.
echo.

echo ■ 진단 결과

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /s | find /I "AutoAdminLogon"  > nul
if not errorlevel 1 (
	reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" | findstr /C:"0x1"  > nul
	if not errorlevel 1 (
		echo 	→ 취약 ^(AutoAdminLogon 값이 1로 설정되어 있는 경우^)
		echo.
		echo.
		echo ■ 조치 방안
		echo 	Step1^) 시작 -^> 실행 -^> REGEDIT -^> HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon 선택
		echo 	Step2^) “AutoAdminLogon 값”을 “0“으로 설정
		echo 	Step3^) DefaultPassword 엔트리가 존재한다면 삭제
		call %CHK_FILE% PWN %1
	) else (
		echo 	→ 양호 ^(AutoAdminLogon 값이 0임^)
		call %CHK_FILE% SAFE %1
	)

) else (
    echo 	→ 양호 ^(AutoAdminLogon 값이 없음^)
	call %CHK_FILE% SAFE %1
)

echo.
echo.


