@echo off

echo [w75] ��� �޽��� ����                                                   

echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo [ W-75 "��� �޽��� ����" ]                                            	         			>>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "legalnoticecaption"           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "legalnoticetext"              >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo.                                                                                           >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo W-75 END                                                                                   >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
echo ======================================================================================     >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt                                                                                         >>	[RESULT]_%COMPUTERNAME%_WINSVR.txt
