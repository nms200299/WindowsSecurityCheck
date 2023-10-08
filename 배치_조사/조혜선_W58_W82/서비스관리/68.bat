@echo off

echo [w68] 예약된 작업에 의심스러운 멸령이 등록되어 있는지 점검                                                    

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-68 "예약된 작업에 의심스러운 멸령이 등록되어 있는지 점검" ]                                              >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.# 예약된 작업 확인 (at) #                                                                      >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
at                                                                                              >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.# 예약된 작업 확인 (schtasks) #                                                                >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
schtasks                                                                                        >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-68 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt