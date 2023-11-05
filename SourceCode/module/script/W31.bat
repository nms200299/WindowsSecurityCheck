@echo off
echo W-31 START
echo.                                                                                         
echo [W31] 최신 서비스 적용                                                              
echo.
echo ■ 진단 현황                                                                                         
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v MinorVersion 
systeminfo | find "OS " 
echo ■ 결과 : 경고