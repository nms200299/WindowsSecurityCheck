@echo off
echo ###################################################################################
echo [W61] 서비스 관리 - SNMP 서비스 커뮤니티스트링의 복잡성 설정
echo.

echo ■ 진단 기준
echo 	양호 : SNMP 서비스를 사용하지 않거나 Community String이 public, private이 아님.
echo 	취약 : SNMP 서비스를 사용하며, Community String이 public, private인 상태임.
echo.
echo.

echo ■ 진단 결과
net start | findstr /I /C:"SNMP Service"
if errorlevel 1 (
	echo 	→ 양호 ^(SNMP 서비스를 사용하지 않음^)
    goto SAFE
) else (
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" | findstr /I /C:"0x4"
	if errorlevel 1 (
		echo 	→ 취약 ^(읽기 전용으로 설정된 Community String이 없음^)
	    goto PWN
	) else (
		reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" | findstr /I /C:"public" >nul
		if not errorlevel 1 (
			echo 	→ 취약 ^(Public으로 구성된 Community String이 있음^)
		    goto PWN
		)
		reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" | findstr /I /C:"private" >nul
		if not errorlevel 1 (
			echo 	→ 취약 ^(Private으로 구성된 Community String이 있음^)
		    goto PWN
		)
		echo 	→ 양호 ^(Public, Private이 아닌 읽기 권한의 Community String이 있음^)
		goto SAFE
	)
)


:PWN
echo.
echo.
echo ■ 조치 방안
echo 	step1^) 시작 -^> 실행 -^> SERVICES.MSC -^> SNMP Service 또는, SNMP 서비스  속성 -^> 보안 -^> '인증 트랩 보내기' 아래 '추가' 버튼
echo    step2^) 'SNMP 서비스 구성' -^> 쓰기 권한이 필요하지 않다면 커뮤니티 이름을 읽기 전용으로 Public/Private이 아닌 이름을 추가
echo    step3^) 시작 -^> 실행 -^> SERVICES.MSC -^> SNMP Service 또는, SNMP 서비스 -^> 속성 -^> '일반' 탭에서 “시작 유형”을 “사용 안 함”으로 설정한 후, SNMP 서비스 중지
call %CHK_FILE% PWN %1
goto CONTINUE

:SAFE
call %CHK_FILE% SAFE %1

:CONTINUE
echo.
echo.