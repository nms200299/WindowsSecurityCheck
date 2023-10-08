@echo off

echo [w77] LAN Manager 인증 수준                                                   

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-77 "LAN Manager 인증 수준" ]                                            	         	    >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "LmCompatibilityLevel"         >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-77 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
