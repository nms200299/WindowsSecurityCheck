@echo off

echo [w81] 시작프로그램 목록 분석                                                   

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-81 "시작프로그램 목록 분석" ]                                            	           		>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\Windows\CurrentVersion\Run"    			    >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"      				>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-81 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
