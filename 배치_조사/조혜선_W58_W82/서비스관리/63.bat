@echo off

echo [w63] DNS ���� ���� ����

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-63 "DNS ���� ���� ����" ]                                                                 >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net start | find /I "DNS Server" || echo. DNS Server ���� �� ������                                >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net start | find /I "DNS Server" && echo. DNS Server ���� ������                                  >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net start | find /I "DNS Client" || echo. DNS Client ���� �� ������                                >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net start | find /I "DNS Client" && echo. DNS Client ���� ������                                  >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo # DNS Server ���� ������Ʈ ��� ���� #                                                             >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find "SecureSecondaries"     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
netstat -na | find "53" | find /I "LISTENING"                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-63 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt