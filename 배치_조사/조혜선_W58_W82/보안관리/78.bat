@echo off

echo [w78] 보안 채널 데이터 디지털 암호화 또는 서명                                                   

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-78 "보안 채널 데이터 디지털 암호화 또는 서명" ]                                            	    >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "RequireSignOrSeal"            >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "SealSecureChannel"            >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "SignSecureChannel"            >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-78 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
