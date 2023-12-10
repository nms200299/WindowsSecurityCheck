@echo off
echo ###################################################################################
echo [W58] 서비스 관리 - 터미널 서비스 암호화 수준 설정
echo.

echo ■ 진단 기준
echo    양호 :  터미널 서비스를 사용하지 않거나 사용 시 암호화 수준을 "클라이언트와 호환 가능^(중간^)" 이상으로 설정한 경우
echo    취약 :  터미널 서비스를 사용하고 암호화 수준이 "낮음"으로 설정한 경우
echo.
echo.

echo ■ 진단 결과　
net start | find /I "Remote Desktop Services"
if errorlevel 1 (
    echo    → 양호 ^(터미널 서비스를 사용하지 않습니다^)
    goto SAFE
) else (
    reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MinEncryptionLevel"
    if errorlevel 1 (
        echo    → 취약 ^(암호화 수준이 '구성되지 않음' 또는 '사용 안 함'으로 설정되어 있음^)
        goto PWN
    ) else (
        reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MinEncryptionLevel" | findstr /C:"0x1" >NUL
        if errorlevel 1 (
            echo    → 양호 ^(암호화 수준이 '클라이언트 호환 가능' 이상으로 설정되어 있음^)
            goto SAFE
        ) else (
            echo    → 취약 ^(암호화 수준이 '낮은 수준'으로 설정되어 있음^)
            goto PWN
        )

    )

)


:PWN
echo.
echo.
echo ■ 조치 방안
echo    step 1^) 시작 -^> 실행 - GPEDIT.MSC : 로컬 그룹 정책 편집기
echo    step 2^) 컴퓨터 구성- 관리 템플릿- Windows 구성 요소 -^> 터미널 서비스 -^> 원격 데스크톱 세션 호스트 -^> 보안
echo    step 3^) "클라이언트 연결 암호화 수준 설정" -^> "암호화 수준"을 클라이언트 호환 가능으로 설정
call %CHK_FILE% PWN %1
goto CONTINUE

:SAFE
call %CHK_FILE% SAFE %1

:CONTINUE
echo.
echo.
