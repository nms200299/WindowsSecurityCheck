@echo off
echo ###################################################################################
echo [W12] ���񽺰��� - IIS CGI ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :IIS CGI ���� ������ �ϴ� scripts ������ �������� �ʽ��ϴ�.
echo 	��� :IIS CGI ���� ������ �ϴ� scripts ������ �����մϴ�.

echo �� ���� ���
if exist "C:\inetpub\wwwroot\scripts.file" (
    echo ���: IIS CGI ���� ������ �ϴ� scripts ������ �����մϴ�.
		echo �� ��ġ ���
	echo 	Step1^) Ž����> �ش� ���丮> �Ӽ�> ����
	echo 	Step2^) Everyone�� ��� ����,���� ����, ���� ���� ����

) else (
    echo ��ȣ: IIS CGI ���� ������ �ϴ� scripts ������ �������� �ʽ��ϴ�.
)
	
pause
