@echo off
echo ###################################################################################
echo [W59] ���� ���� - IIS �� ���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  �� ���� ���� �������� ������ �����Ǿ� ����.
echo 	��� :  �� ���� ���� �������� ������ �������� �ʾ� ���� �߻� �� �߿� ���� �� ����Ǿ� ����.
echo.
echo.

echo �� ���� �����
set filePath=C:\inetpub\wwwroot
set flag=0

type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /I /C:"httpErrors errorMode=\"Custom"
if errorlevel 1 (
	type %filePath%\web.config | findstr /I /C:"httpErrors errorMode=\"Custom"
	if errorlevel 1 (
		echo    �� ��� ^(�� ���� ���� �������� ������ �������� ����^)
		echo.
		echo.
		echo �� ��ġ ���
		echo 	Step1^) ���� -^> ���� ���� -^> IIS'���ͳ� ���� ����' ������ -^> �ش� �� ����Ʈ
		echo        -^> '���� ������' -^> '�۾�' �ǿ��� '��� ���� ����' -^> ������ ���� �߻� �� ���� ��ȯ�� �׸��� ������� ���� ���� ���������� ����
		call %CHK_FILE% PWN %1
	) else (
		echo    �� ��ȣ ^(���� �������� �� ���� ���� �������� ������ �����Ǿ� ����^)
		call %CHK_FILE% SAFE %1
	)
) else (
	echo    �� ��ȣ ^(���� �������� �� ���� ���� �������� ������ �����Ǿ� ����^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.
