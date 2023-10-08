@echo off

echo [w80] 컴퓨터 계정 암호 최대 사용 기간                                                   

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-80 "컴퓨터 계정 암호 최대 사용 기간" ]                                            	            >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" | find /I "DisablePasswordChange"     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" | find /I "MaximumPasswordAge"        >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-80 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
