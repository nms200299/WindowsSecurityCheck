echo [ W-10 "IIS 서비스 구동 점검" ]                                                                 >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo. # IIS ADMIN 확인 #                                                                         >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt
net start | find /I "IIS Admin"                                                                 >>	[RESULT]_%COMPUTERNAME%_WIN.txt   
echo. # World Wide Web Publishing Service 확인 #                                                 >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt
net start | find /I "World Wide Web Publishing Service"                                         >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo. # IIS 버전 #                                                                               >>	[RESULT]_%COMPUTERNAME%_WIN.txt
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\InetStp                                         >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo W-10 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt