@echo off
echo ###################################################################################
echo [W63] 서비스 관리 - DNS 서비스 구동 점검
echo.

echo ■ 진단 기준
echo 	양호 : DNS 서비스를 사용하지 않거나 동적 업데이트 “없음 또는 아니오”으로 설정되어 있음.
echo 	취약 : 서비스를 사용하며 동적 업데이트가 설정되어 있음.
echo.
echo.

echo ■ 진단 결과
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\dx" | find /v 1
if %errorlevel% EQU 0 (
	echo 	→ 양호 ^(DNS 서비스를 사용하지 않거나 동적 업데이트 “없음 또는 아니오”으로 설정됨^)
	call %CHK_FILE% SAFE %1
) else (
	echo 	→ 취약 ^(서비스를 사용하며 동적 업데이트가 설정됨^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> DNSMGMT.MSC -^> 각 조회 영역 -^> 해당 영역 -^> 속성 -^> 일반
	echo 	Step2^) 동적 업데이트 → 없음 또는, 아니오 선택
    echo    Step3^) 시작 -^> 실행 -^> SERVICES.MSC -^> DNS 서버 -^> 속성 '일반' 탭에서 "시작 유형"을 "사용 안 함"으로 설정한 후, DNS 서비스 중지
	call %CHK_FILE% PWN %1
)
echo.
echo.