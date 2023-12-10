@echo off
echo ###################################################################################
echo [W29] 서비스 관리 - DNS Zone Transfer 설정
echo.

echo ■ 진단 기준
echo 	양호 :  DNS 서비스를 사용하지 않는 경우 , 영역 전송 허용을 하지 않는 경우 , 특정 서버로만 설정이 되어 있는 경우
echo 	취약 :  위 3개의 기준 중 하나라도 해당 되지 않는 경우
echo.
echo.

echo ■ 진단 결과

net start | findstr /C:"DNS Server"
if not errorlevel 1 (
	reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server"
	if not errorlevel 1 (
		reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s 2>nul | find "SecureSecondaries" | find "0x2"
		rem 0이면 아무 서버,
		rem 1이면 이름 서버
		rem 2면 다음 서버
		rem 3이면 영역 전송 사용하지 않음
		if not errorlevel 1 (
			echo 	→ 양호 ^(DNS Zone Transfer 설정됨^)
			call %CHK_FILE% SAFE %1
		) else (
			reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s 2>nul | find "SecureSecondaries" | find "0x3"
			if not errorlevel 1 (
				echo 	→ 양호 ^(영역 전송을 허용하지 않음^)
				call %CHK_FILE% SAFE %1
			) else (
				echo 	→ 취약 ^(다음 서버로만 설정이 되어 있지 않음^)
				echo.
				echo.
				echo ■ 조치 방안
				echo 	Step1^) 시작 -^> 실행 -^> DNSMGNT.MSC -^> 각 조회 영역 -^> 해당 영역 -^> 속성 -^> 영역 전송
				echo 	Step2^) "다음 서버로만" 선택 -^> 전송할 서버 IP 추가
				call %CHK_FILE% PWN %1
			)

		)
	) else (
		echo 	→ 양호 ^(DNS 서버를 사용하지 않음^)
		call %CHK_FILE% SAFE %1
	)
) else (
	echo 	→ 양호 ^(DNS 서버를 사용하지 않음^)
	call %CHK_FILE% SAFE %1
)

echo.
echo.



