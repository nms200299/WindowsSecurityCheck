@echo off

echo [w73] 사용자가 프린터 드라이버를 설치할 수 없게 함                                                    

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-73 "사용자가 프린터 드라이버를 설치할 수 없게 함" ]                                            	>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AddPrinterDrivers"            >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-73 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
