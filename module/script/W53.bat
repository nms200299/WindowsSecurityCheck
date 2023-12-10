@echo off
echo ###################################################################################
echo [W53] 계정 관리 - 로컬 로그온 허용
echo.

echo ■ 진단 기준
echo 	양호 :  로컬 로그온 허용 정책에 Administrators, IUSR_ 만 존재하는 경우
echo 	취약 :  로컬 로그온 허용 정책에 Administrators, IUSR_ 외 다른 계정 및 그룹이 존재하는 경우
echo 	주의 :  프로그램을 통해 판단할 수 없음.
echo.
echo.

echo ■ 진단 결과
set "flag=0"
call .\module\mod_createSecEdit.bat
for /F "tokens=1-5 delims=*" %%a in ('type .\module\tmp\securityPolicy.txt ^| find /i "SeInteractiveLogonRight"') do (
    echo %%b | findstr /C:"S-1-5-32-544" /C:"S-1-5-32-568" >nul
    if errorlevel 1 (
        set "flag=1"
    )
    rem 첫 번째 유저가 S-1-5-32-544 또는 S-1-5-32-568가 아니면 취약

    echo %%c | findstr /C:"S-1-5-32-544" /C:"S-1-5-32-568" >nul
    if errorlevel 1 (
        echo %%c | findstr /C:"S" > nul
        if not errorlevel 1 (
            set "flag=1"
        )
    )
    rem 두 번째 유저가 S-1-5-32-544 또는 S-1-5-32-568가 아니면 취약

    echo %%d | findstr /C:"S" > nul
    if not errorlevel 1 (
        set "flag=1"
    )
    rem 세 번째 유저에 S 문자가 들어있으면 취약
)


if !flag! EQU 1 (
    echo    → 취약 ^(로컬 로그온 허용 정책에 Administrators, IUSR_ 외 다른 계정 및 그룹이 존재^)
    echo.
    echo.
    echo ■ 조치 방안
    echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 사용자 권한 할당
    echo 	Step2^) "로컬 로그온 허용(또는, 로컬 로그온)" 정책에 "Adminstrators", "IUSR_" 외 다른 계정 및 그룹 제거
    call %CHK_FILE% PWN %1
) else (
    echo    → 양호 ^(로컬 로그온 허용 정책에 Administrators, IUSR_ 만 존재^)
    call %CHK_FILE% SAFE %1
)

echo.
echo.