@echo off

echo [w63] DNS 서비스 구동 점검

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-63 "DNS 서비스 구동 점검" ]                                                                 >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net start | find /I "DNS Server" || echo. DNS Server 서비스 미 구동중                                >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net start | find /I "DNS Server" && echo. DNS Server 서비스 구동중                                  >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net start | find /I "DNS Client" || echo. DNS Client 서비스 미 구동중                                >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
net start | find /I "DNS Client" && echo. DNS Client 서비스 구동중                                  >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo # DNS Server 동적 업데이트 사용 여부 #                                                             >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find "SecureSecondaries"     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
netstat -na | find "53" | find /I "LISTENING"                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-63 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt