@echo off

echo [w71] ���ݿ��� �̺�Ʈ �α� ���� ���� ����                                                    

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-71 "���ݿ��� �̺�Ʈ �α� ���� ���� ���� " ]                                                     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
icacls %systemroot%\system32\Winevt\Logs | find /v "������ ó��������"                               >>  [RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
icacls %systemroot%\system32\config | find /v "������ ó��������" 									>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt 2>&1
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-71 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
