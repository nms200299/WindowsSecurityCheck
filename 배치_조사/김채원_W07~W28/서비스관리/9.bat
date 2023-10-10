echo. W-09 START
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-09 "불필요한 서비스 제거" ]                                                  				>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
	net start | find /I "Alerter"                   ||  echo.  Alerter 서비스가 구동중이지 않습니다.	>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
	net start | find /I "ClipBook"                  ||  echo.  ClipBook 서비스가 구동중이지 않습니다.	>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
	net start | find /I "Messenger"                 ||  echo.  Messenger 서비스가 구동중이지 않습니다.	>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
	net start | find /I "Simple TCP/IP Services"    ||  echo.  Simple TCP/IP Services 서비스가 구동중이지 않습니다.	>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>  [RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-09 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================