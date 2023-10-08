@echo off

echo [w70] 이벤트 로그 관리 설정                                                    

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-70 "이벤트 로그 관리 설정" ]                                                                  >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo. # 응용프로그램 확인 #                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application" | find /I "MaxSize"     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application" | find /I "Retention"   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo. # 시스템 확인 #                                                                               >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\System" | find /I "MaxSize"          >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\System" | find /I "Retention"        >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo. # 보안 확인 #                                                                                >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security" | find /I "MaxSize"        >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security" | find /I "Retention"      >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-70 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
