@echo off
echo ###################################################################################
echo [W17] ���� ���� - IIS ���� ���ε� �� �ٿ�ε� ����
echo.

echo �� ���� ����
echo    ��ȣ : �� ���μ����� ���� �ڿ� ������ ���� ���ε� �� �ٿ�ε� �뷮�� ������
echo    ��� : �� ���μ����� ���� �ڿ� �������� ���� ^(���ε� �� �ٿ�ε� �뷮 ������^)
echo.
echo.

echo �� ���� �����
set dirPath=C:\inetpub\wwwroot
set flag=0
if exist %dirPath%\web.config (
	type %dirPath%\web.config | findstr /C:"maxAllowedContentLength=" >nul
	if errorlevel 1 (
		echo    �� ��� ^(web.config ���Ͽ� maxAllowedContentLength ������ ����^)
		set flag=1
	)
) else (
	echo    �� ��� ^(��Ʈ ���丮 ������ web.config ������ �������� ����^)
	set flag=1
)

type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /C:"bufferingLimit="  >nul
if errorlevel 1 (
	echo    �� ��� ^(applicationHost.config ���Ͽ� bufferingLimit ������ ����^)
	set flag=1
)

type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /C:"maxRequestEntityAllowed="  >nul
if errorlevel 1 (
	echo    �� ��� ^(applicationHost.config ���Ͽ� maxRequestEntityAllowed ������ ����^)
	set flag=1
)


if !flag! EQU 1 (
	echo.
	echo.
    echo �� ��ġ ���
    echo    Step1^) �� ����Ʈ�� ��Ʈ ���丮�� web.config ���� �� �Ʒ� �׸� �߰� ^(������ ���� ����^)
    echo             ^<configuration^>
    echo               ^<system.webServer^>
	echo                 ^<security^>
	echo                   ^<requestFiltering^>
	echo                     ^<requestLimits maxAllowedContentLength="������ �뷮" /^>
	echo                   ^</requestFiltering^>
	echo                 ^</security^>
    echo               ^</system.webServer^>
    echo             ^</configuration^>
    echo    Step2^) ^%systemroot^%\System32\inetsrv\config\applicationHost.config ���� �� �Ʒ� �׸� �߰�
    echo             ^<system.webServer^>
    echo               ^<asp^>
    echo                 ^<limits bufferingLimit="���� �ٿ�ε� �뷮" maxRequestEntityAllowed="���� ���ε� �뷮" /^>
    echo               ^</asp^>
    echo             ^</system.webServer^>
    echo    �� Default ���� ��
    echo             ^(1^) maxAllowedContentLength ^(������ �뷮^) : Default: 30MB
    echo             ^(2^) maxRequestEntityAllowed ^(���� ���ε� �뷮^) : Default: 200000
    echo             ^(3^) bufferingLimit ^(���� �ٿ�ε� �뷮^) : Default: 4MB
    call %CHK_FILE% PWN %1
) else (
	echo    �� ��ȣ ^(���ε� �� �ٿ�ε� �뷮�� ������^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.