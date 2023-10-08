@echo off

echo [w59] IIS À¥ ¼­ºñ½º Á¤º¸ ¼û±è

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-59 "IIS À¥ ¼­ºñ½º Á¤º¸ ¼û±è" ]                                                               >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
type [RESULT]_%COMPUTERNAME%_IIS7_Security_Policy.txt | findstr /I "statusCode="                >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo    @ IIS 7.0                                                                               >> [RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
TYPE [RESULT]_%COMPUTERNAME%_IIS7_Security_Policy.txt | findstr /I "error statusCode"           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-59 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt