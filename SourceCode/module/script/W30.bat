@echo off
echo ###################################################################################
echo [W30] RDS(Remote Data Services) 제거
echo.

echo ■ 진단 기준
echo    양호 : IIS를 사용하지 않는 경우, Windows 2000 서비스팩 4, Windows 2003 서비스팩 2 이상 설치되어 있는 경우,
echo        디폴트 웹 사이트에 MSADC 가상 디렉토리가 존재하지 않는 경우, 해당 레지스트리 값이 존재하지 않는 경우
echo    취약 : 양호 기준에 한 가지도 해당되지 않는 경우
echo.
echo.

echo ■ 진단 결과
for /f "tokens=2 delims=[]" %%A in ('ver') do (
    for /f "tokens=2" %%B in ("%%A") do (
        set "version_number=%%B"
    )
)

if !version_number! LSS 6 (
    echo 	→ 주의 ^(판단 불가^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> INETMGR -^> 웹 사이트 선택 후 오른쪽 디렉토리에서 msadc 제거
	echo 	Step2^) 다음의 레지스트리 키/디렉토리 제거
	echo	HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\RDSServer.DataFactory
	echo	HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\AdvancedDataFactory
	echo	HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch\VbBusObj.VbBusObjCl
	call %CHK_FILE% WARN %1
) else (
	echo 	→ 양호 ^(Windows Server 2008 이상^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.
