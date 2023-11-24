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
net start | find /I "SNMP"
if %errorlevel% EQU 0 (
	echo 	→ 양호 ^(SNMP 서비스를 사용하지 않음^)
    call %CHK_FILE% SAFE %1
) else (
	echo 	→ 취약 ^(SNMP 서비스를 사용함^)
    echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SERVICES.MSC -^> SNMP Service 또는, SNMP 서비스  속성 -^> 보안 -^> '인증 트랩 보내기' 아래 '추가' 버튼
	echo    Step2^) 'SNMP 서비스 구성' -^> 쓰기 권한이 필요하지 않다면 커뮤니티 이름을 읽기 전용으로 Public/Private이 아닌 이름을 추가
    echo    Step3^) 시작 -^> 실행 -^> SERVICES.MSC> SNMP Service 또는, SNMP 서비스 -^> 속성 -^> '일반' 탭에서 “시작 유형”을 “사용 안 함”으로 설정한 후, SNMP 서비스 중지
    call %CHK_FILE% PWN %1
)
echo.
echo.