@echo off
echo ###################################################################################
echo [W18] ���� ���� - IIS DB ���� ����� ����
echo.

echo �� ���� ����
echo    ��ȣ : .asa ���ν�, Ư�� ���۸� �����ϵ��� �����Ͽ� ������ �Ǵ� ������ ����.
echo    ��� : .asa ���ν�, ��� ������ �����ϵ��� ������.
echo.
echo.

echo �� ���� ���
set "configPath=C:\Windows\System32\inetsrv\config\applicationHost.config"
set "filePath=C:\inetpub\wwwroot"
set "subModPath=.\module\script\W21-1.bat"
set "flag=0"
set "flag1=0"
call %subModPath% .asa
echo.

if !flag1! EQU 0 (
	echo    �� ��ȣ ^(��û ���͸����� �ش� Ȯ���ڰ� false�� ������^)
	echo      ^(����� ���� ���� ������ �ִ��� Ư�� ���۸� �����ϵ��� �����Ͽ��⿡ ��ȣ^)
	call %CHK_FILE% SAFE %1
) else (
	echo    �� ��� ^(��û ���͸����� �ش� Ȯ���ڰ� true�� ���� �Ǵ� �������� ����^)
	if !flag! EQU 1 (
		echo    �� ��� ^(�ش� Ȯ���ڰ� ���� ���� ������ ��ϵǾ� ����^)
	)
	echo.
	echo.
	echo �� ��ġ ���
	echo    step 1^) ������ ���� ��� ��ȣ
	echo        ���ͳ� ���� ����^(IIS^) ������ -^> �ش� �� ����Ʈ -^> IIS -^> "ó���� ���Ρ� ����, ��� �׸� *.asa / *.asax ��ϵ��� ���� ��� ��ȣ
	echo    step 2^) asa / asax ���� ��û ���͸��� false�̸� ��ȣ
	echo        ���ͳ� ���� ����^(IIS^) ������ -^> �ش� �� ����Ʈ -^> IIS -^> "��û ���͸�" ����, /asa / .asaxȮ���ڰ� false�� �����Ǿ� ������ ��ȣ
	call %CHK_FILE% PWN %1
)
echo.
echo.
