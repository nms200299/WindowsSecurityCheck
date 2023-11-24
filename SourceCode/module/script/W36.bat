@echo off
echo ###################################################################################
echo [W36] 보안 관리 - 백신 프로그램 설치
echo.

echo ■ 진단 기준
echo 	양호 : 바이러스 백신 프로그램이 설치되어 있는 경우
echo 	취약 : 바이러스 백신 프로그램이 설치되어 있지 않은 경우
echo    주의 :  프로그램을 통해 판단 할 수 없음
echo.
echo.

echo ■ 진단 결과　
echo 	→ 주의 ^(판단 불가^)
echo.
echo.

echo ■ 조치 방안
echo    - 담당자를 통해 바이러스 백신을 반드시 설치하여야 하도록 함
echo        안철수 연구소^(V3^) : http://www.ahnlab.com
echo        하우리 : http://www.hauri.co.kr
echo        시만텍코리아 : http://www.symantec.co.kr
echo        한국트렌드마이크로 : http://www.trendmicro.co.kr
echo        알약 : https://en.estsecurity.com
call %CHK_FILE% WARN %1
echo.
echo.