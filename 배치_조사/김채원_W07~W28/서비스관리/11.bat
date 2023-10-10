echo. W-11 START
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo [ W-11 "IIS 디렉터리 리스팅 제거" ]                                                               >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt
type [RESULT]_%COMPUTERNAME%_IIS7_Security_Policy.txt | Find /I "directoryBrowse"               >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo W-11 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WIN.txt