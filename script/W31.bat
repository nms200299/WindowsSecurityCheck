@echo off
echo W-31 START
echo.                                                                                         
echo [W31] �ֽ� ���� ����                                                              
echo.
echo �� ���� ��Ȳ                                                                                         
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v MinorVersion 
systeminfo | find "OS " 
echo �� ��� : ���