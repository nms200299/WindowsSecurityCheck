@echo off

echo [w70] �̺�Ʈ �α� ���� ����                                                    

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-70 "�̺�Ʈ �α� ���� ����" ]                                                                  >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo. # �������α׷� Ȯ�� #                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application" | find /I "MaxSize"     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application" | find /I "Retention"   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo. # �ý��� Ȯ�� #                                                                               >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\System" | find /I "MaxSize"          >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\System" | find /I "Retention"        >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo. # ���� Ȯ�� #                                                                                >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security" | find /I "MaxSize"        >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security" | find /I "Retention"      >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-70 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
