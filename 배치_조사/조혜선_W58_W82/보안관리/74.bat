@echo off

echo [w74] 세션 연결을 중단하기 전에 필요한 유휴시간                                                    

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-74 "세션 연결을 중단하기 전에 필요한 유휴시간" ]                                            	    >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net config server /n | find "유휴"																>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net config server /n | find "Idle session"																>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-74 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt

