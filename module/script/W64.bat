@echo off
echo ###################################################################################
echo [W64] ���� ���� - HTTP/FTP/SMTP ��� ����
echo.

echo �� ���� ����
echo 	��ȣ :  HTTP, FTP, SMTP ���� �� ��� ������ ������ ����.
echo 	��� :  HTTP, FTP, SMTP ���� �� ��� ������ ������.
echo 	���� :  ���α׷��� ���� �Ǵ��� �� ����.
echo.
echo.

echo �� ���� �����
echo 	�� ���� ^(�Ǵ� �Ұ�^)
echo.
echo.

echo �� ��ġ ���
echo   - HTTP
echo 	step1^) Microsoft �ٿ�ε� ���Ϳ��� UrlScan�� ��ġ
echo 	step2^) IIS ������ -^> IIS -^> ISAPI ����
echo 	step3^) ���� �߰� -^> UrlScan 3.1 - "C:\Windows\System32\inetsrv\urlscan\urlscan.dll"
echo 	step4^) urlcsan.ini ����^(C:\Windows\System32\inetsrv\urlscan\urlscan.ini^)�� �ش� �� ����
echo 	        - RemotesserverHeader=1
echo            - AllowDotInPath=1
echo.
echo   - FTP
echo 	step1^) IIS ������ -^> FTP �޽��� -^> �⺻ ��� ����� ����
echo   - SMTP
echo.
echo 	step1^) IIS ������ -^> ���� ��ü ��Ŭ�� -^> ��Ÿ���̽� ���� ���� ��� ����
echo 	step2^) ^<IIsSmtpServerLocation="/LM/SmtpSvc/1"^>�� ConnectResponse �Ӽ� ���� �߰��� SMTP ��� ���� ����
call %CHK_FILE% WARN %1
echo.
echo.