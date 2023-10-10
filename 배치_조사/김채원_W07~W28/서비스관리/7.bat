echo. W-07 START
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-07 "Everyone 사용 권한을 익명 사용자에게 적용" ]                                               	>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ■ Everyone 그룹에 익명 보안 식별자가 포함되는지 여부 ■                        					    >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | find /i "everyoneincludesanonymous" | find /v "1"       >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.    																					    >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-07 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo