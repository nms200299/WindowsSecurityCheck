@echo off
echo ###################################################################################
echo [W13] ���� ���� - IIS ���� ���丮 ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  IIS ���� ���丮 ���� ���� ���� ����
echo 	��� :  IIS ���� ���丮 ���� ���� ���� ������
echo.
echo.

echo �� ���� ���
set "filePath=C:\Windows\System32\inetsrv\config\applicationHost.config"
if exist %filePath% (
	type %filePath% | findstr /C:"enableParentPaths=\"true"
	if errorlevel 1 (
	    echo    �� ��ȣ ^(IIS ���� ���丮 ���� ���� ���� ����^)
	    call %CHK_FILE% SAFE %1
	) else (
	    echo    �� ��� ^(�ϳ� �̻��� �� ����Ʈ�� IIS ���� ���丮 ���� ��� ���� ����^)
	    echo.
	    echo.
		 echo �� ��ġ ���
		 echo    Step1^) ������ -^> �������� -^> IIS ������ -^> �ش� ������Ʈ -^> IIS -^> ASP ���� -^> "�θ��� ���" �׸� "False" ���� Ȯ��
		 call %CHK_FILE% PWN %1
	)
) else (
	echo    �� ��ȣ ^(IIS�� ��ġ�Ǿ� ���� ����^)
	call %CHK_FILE% SAFE %1 
)

echo.
echo.
