@echo off
echo W-35 START
echo. 
echo [W35] 원격으로 액세스 할 수 있는 레지스트리 경로
echo.
echo ■ 진단 현황
net start | find /I "Remote Registry"
sc config RemoteRegistry start=disabled
net stop RemoteRegistry
echo ■ 결과 : 안전