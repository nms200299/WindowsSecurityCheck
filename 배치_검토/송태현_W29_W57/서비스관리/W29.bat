@echo off
echo ###################################################################################
echo [W29] 서비스 관리 - DNS Zone Transfer 설정
echo.

echo ■ 진단 기준
echo 	양호 :  DNS 서버스를 사용하지 않는 경우 , 영역 전송 허용을 하지 않는 경우 , 특정 서버로만 설정이 되어 있는 경우
echo 	취약 :  위 3개의 기준 중 하나라도 해당 되지 않는 경우
echo.
echo.

echo ■ 진단 결과
rem 0이면 아무서버 1,2면 특정 서버 이므로 0을 찾음
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s 2>nul | find "SecureSecondaries" | find "0x0"
if errorlevel 1 (
		echo 	→ 양호 ^(DNS Zone Transfer 설정됨^)
		call %CHK_FILE% SAFE %1
    ) else (
		echo 	→ 취약 ^(특정 서버로만 설정이 되어 있지 않음^)
		echo ■ 조치 방안
		echo 	Step1^) 시작 -^> 실행 -^> DNSMGNT.MSC -^> 각 조회 영역 -^> 해당 영역 -^> 속성 -^> 영역 전송
		echo 	Step2^) "다음 서버로만" 선택 -^> 전송할 서버 IP 추가
		echo.
		echo.
		call %CHK_FILE% PWN %1
	    )
echo.
echo.



