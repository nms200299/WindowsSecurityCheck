@echo off

echo [w82] Windows ���� ��� ���                                                   

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-82 "Windows ���� ��� ���" ]                                                             	>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo  �� MS-SQL ���� Ȯ�� ��                                          						        >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net start | find /I "SQL Server"																>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo  �� MS-SQL ���� ��� Ȯ�� ��                                          						    >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server" mssqlreg_%COMPUTERNAME%_WINSVR.dmp
TYPE mssqlreg_%COMPUTERNAME%.dmp | findstr "LoginMode"											>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKLM\Software\Microsoft\Microsoft SQL Server" /s | findstr /i "LoginMode"			>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-82 END
