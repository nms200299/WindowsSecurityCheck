@echo off
echo W-35 START
echo. 
echo [W35] �������� �׼��� �� �� �ִ� ������Ʈ�� ���
echo.
echo �� ���� ��Ȳ
net start | find /I "Remote Registry"
sc config RemoteRegistry start=disabled
net stop RemoteRegistry
echo �� ��� : ����