@echo off
echo ###################################################################################
echo [W38] 보안 관리 - 화면보호기 설정
echo.

echo ■ 진단 기준
echo 	양호 : 화면 보호기를 설정하고 대기 시간이 10분 이하의 값으로 설정되어 있으며, 화면 보호기 해제를 위한 암호를 사용하는 경우
echo 	취약 : 화면 보호기가 설정되지 않았거나 암호를 사용하지 않은 경우 또는, 화면 보호기 대기 시간이 10분을 초과한 값으로 설정되어 있는 경우
echo.
echo.


echo ■ 진단 결과
reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v "SCRNSAVE.EXE" > nul
if errorlevel 1 (
    echo  	→ 취약 ^(화면 보호기 사용 안됨^)
    echo.
    echo.
    echo ■ 조치 방안
	echo 	Step1^) 제어판 -^> 디스플레이 -^> 화면보호기 변경 -^> 화면 보호기 사용
    call %CHK_FILE% PWN %1
) else (
    reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ScreenSaverIsSecure" | find "1" > nul
    if errorlevel 1 (
        echo  	→ 취약 ^(다시 시작할 때 로그온 표시 안됨^)
        echo.
        echo.
		echo ■ 조치 방안
		echo 	Step1^) 제어판 -^> 디스플레이 -^> 화면보호기 변경 -^> 다시 시작할 때 로그온 표시 체크
		call %CHK_FILE% PWN %1
    ) else (
        for /F "tokens=3" %%a in ('reg query "HKEY_CURRENT_USER\Control Panel\Desktop" ^| find /i "ScreenSaveTimeOut"') do (
            set /a "timeout=%%a"
            if !timeout! GTR 600 (
				echo  	→ 취약 ^(대기 시간이 10분이상^)
                echo.
                echo.
				echo ■ 조치 방안
				echo 	제어판 -^> 디스플레이 -^> 화면보호기 변경 -^> 대기 시간 설정 -^> 10분으로 설정
				call %CHK_FILE% PWN %1
            ) else (
                echo 	→ 양호 ^(화면 보호기를 설정하고 대기 시간이 10분 이하의 값으로 설정되어 있으며, 화면 보호기 해제를 위한 암호를 사용하는 경우^)
				call %CHK_FILE% SAFE %1
            )
        )
    )
)

echo.
echo.

