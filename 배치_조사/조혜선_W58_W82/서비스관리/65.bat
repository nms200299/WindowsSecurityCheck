@echo off

echo [w65] Telnet ���� ����                            

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-65 "Telnet ���� ����" ]                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net start | find /I "Telnet" || echo. Telnet Service �� ������                                     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net start | find /I "Telnet" && echo. Telnet Service ������                                       >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.# ������Ʈ�� Ȯ�� (NTLM ���� �� Ȯ��)                                                              >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\TelnetServer\1.0" | find /I "NTLM"             >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-65 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt