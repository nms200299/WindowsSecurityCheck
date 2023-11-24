@echo off
echo ###################################################################################
echo [W74] 보안 관리 - 세션 연결을 중단하기 전에 필요한 유휴시간
echo.

echo ■ 진단 기준
echo 	양호 : “로그온 시간이 만료되면 클라이언트 연결 끊기” 정책을 “사용”으로, “세션 연결을 중단하기 전에 필요한 유휴 시간” 정책을 “15분”으로 설정함.
echo 	취약 : “로그온 시간이 만료되면 클라이언트 연결 끊기” 정책이 “사용 안 함”으 로, “세션 연결을 중단하기 전에 필요한 유휴 시간” 정책이 “15분”으로 설정되어 있지 않음. 
echo.
echo.

echo ■ 진단 결과
secedit /EXPORT /CFG log.txt > nul
net config server /n | find "유휴" >> idle.txt
for /f "tokens=5" %%a in (idle.txt) do set idle=%%a
type log.txt | findstr /i "EnableForcedLogOff"  | find "4,0" > nul
if %errorlevel% EQU 0 (
    if %idle% geq 15 (
	echo 	→ 양호 ^(“세션 연결을 중단하기 전에 필요한 유휴 시간” 정책을 “15분”으로 설정함.^)
    call %CHK_FILE% SAFE %1
    ) else (
	echo 	→ 취약 ^("세션 연결을 중단하기 전에 필요한 유휴 시간"이 "15분" 미만임.^)
        echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
    echo    Step2^) "Microsoft 네트워크 서버: 세션 연결을 중단하기 전에 필요한 유휴 시간" 정책 "15분" 설정
    call %CHK_FILE% PWN %1
) else (
	echo 	→ 취약 ^(로그온 시간이 만료되면 클라이언트 연결 끊기 정책"사용" 설정이 아님.^)
    echo 	Step1^) 시작 -^> 실행 -^> SECPOL.MSC -^> 로컬 정책 -^> 보안 옵션
    echo 	Step2^) "Microsoft 네트워크 서버: 로그온 시간이 만료되면 클라이언트 연결 끊기" 정책 "사용" 설정
    call %CHK_FILE% PWN %1
)