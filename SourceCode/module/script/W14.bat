@echo off
echo ###################################################################################
echo [W14] ���� ���� - IIS ���ʿ��� ���� ����
echo.

echo �� ���� ����
echo    ��ȣ : �ش� �� ����Ʈ�� IISSamples, IISHelp ���� ���丮�� �������� ����.
echo    ��� : �ش� �� ����Ʈ�� IISSamples, IISHelp ���� ���丮�� ������ �� ����.
echo.
echo.


echo �� ���� �����
for /f "tokens=2 delims=[]" %%A in ('ver') do (
    for /f "tokens=2" %%B in ("%%A") do (
        set "version_number=%%B"
    )
)

echo OS ���� : %version_number%
if %version_number% LSS 6 (
	echo    �� ��� ^(IIS 7.0^(Windows 2008^) �̸� ���������� Ȯ���� �ʿ��մϴ�^)
	echo.
	echo.
	echo �� ��ġ ���
	echo Windows 2000, 2003�� ��� Sample ���丮 Ȯ�� �� ������.
	echo    ^(c:\inetpub\iissamples^)
	echo    ^(c:\winnt\help\iishelp ^(IIS ����^)^)
	echo    ^(c:\program files\common files\system\msadc\sample ^(������ ������^)^)
	echo    ^(^%SystemRoot^%\System32\Inetsrv\IISADMPWD^)
	call %CHK_FILE% WARN %1
) else (
	echo    �� ��ȣ ^(IIS 7.0^(Windows 2008^) �̻� ���� �ش� ���� ����^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.