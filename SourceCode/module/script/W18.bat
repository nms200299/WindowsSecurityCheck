@echo off
echo ###################################################################################
echo [W18] 서비스 관리 - IIS DB 연결 취약점 점검
echo.

echo ■ 진단 기준
echo    양호 : .asa 매핑시, 특정 동작만 가능하도록 제한하여 설정함 또는 매핑이 없음.
echo    취약 : .asa 매핑시, 모든 동작이 가능하도록 설정함.
echo.
echo.

echo ■ 진단 결과
set "configPath=C:\Windows\System32\inetsrv\config\applicationHost.config"
set "filePath=C:\inetpub\wwwroot"
set "subModPath=.\module\script\W21-1.bat"
set "flag=0"
set "flag1=0"
call %subModPath% .asa
echo.

if !flag1! EQU 0 (
	echo    → 양호 ^(요청 필터링에서 해당 확장자가 false로 설정됨^)
	echo      ^(취약한 매핑 지역 설정이 있더라도 특정 동작만 가능하도록 제한하였기에 양호^)
	call %CHK_FILE% SAFE %1
) else (
	echo    → 취약 ^(요청 필터링에서 해당 확장자가 true로 설정 또는 설정되지 않음^)
	if !flag! EQU 1 (
		echo    → 취약 ^(해당 확장자가 매핑 지역 설정에 등록되어 있음^)
	)
	echo.
	echo.
	echo ■ 조치 방안
	echo    step 1^) 매핑이 없을 경우 양호
	echo        인터넷 정보 서비스^(IIS^) 관리자 -^> 해당 웹 사이트 -^> IIS -^> "처리기 매핑” 선택, 사용 항목에 *.asa / *.asax 등록되지 않을 경우 양호
	echo    step 2^) asa / asax 파일 요청 필터링이 false이면 양호
	echo        인터넷 정보 서비스^(IIS^) 관리자 -^> 해당 웹 사이트 -^> IIS -^> "요청 필터링" 선택, /asa / .asax확장자가 false로 설정되어 있으면 양호
	call %CHK_FILE% PWN %1
)
echo.
echo.
