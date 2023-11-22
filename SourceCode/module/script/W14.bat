@echo off
echo ###################################################################################
echo [W14] 서비스 관리 - IIS 불필요한 파일 제거
echo.

echo ■ 진단 기준
echo    양호 : 해당 웹 사이트에 IISSamples, IISHelp 가상 디렉토리가 존재하지 않음.
echo    경고 : 해당 웹 사이트에 IISSamples, IISHelp 가상 디렉토리가 존재할 수 있음.
echo.
echo.


echo ■ 진단 결과　
for /f "tokens=2 delims=[]" %%A in ('ver') do (
    for /f "tokens=2" %%B in ("%%A") do (
        set "version_number=%%B"
    )
)

echo OS 버전 : %version_number%
if %version_number% LSS 6 (
	echo    → 경고 ^(IIS 7.0^(Windows 2008^) 미만 버전임으로 확인이 필요합니다^)
	echo.
	echo.
	echo ■ 조치 방안
	echo Windows 2000, 2003의 경우 Sample 디렉토리 확인 후 삭제함.
	echo    ^(c:\inetpub\iissamples^)
	echo    ^(c:\winnt\help\iishelp ^(IIS 설명서^)^)
	echo    ^(c:\program files\common files\system\msadc\sample ^(데이터 엑세스^)^)
	echo    ^(^%SystemRoot^%\System32\Inetsrv\IISADMPWD^)
	call %CHK_FILE% WARN %1
) else (
	echo    → 양호 ^(IIS 7.0^(Windows 2008^) 이상 버전 해당 사항 없음^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.