@echo off
echo ###################################################################################
echo [W13] ���� ���� - IIS ���� ���丮 ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  IIS ���� ���丮 ���� ���� ������ ����
echo 	��� :  IIS ���� ���丮 ���� ���� ������ ���� �� ��
echo.
echo.

type "C:\inetpub\wwwroot\web.config" | findstr /C:"<requestFiltering allowDoubleEscaping=\"false"

echo %errorlevel% 

    echo ��ȣ: IIS ���� ���丮 ���� ���� ������ �����մϴ�.
 else 
    echo ���: IIS ���� ���丮 ���� ���� ������ �������� �ʽ��ϴ�.


	echo �� ��ġ ���
	echo 	Step1^) ������ -^> �������� -^> IIS ������ -^> �ش� ������Ʈ -^> IIS -^> ASP ���� -^> "�θ��� ���" �׸� "False" ���� Ȯ��
	call %CHK_FILE% PWN %1

echo.
echo.
pause