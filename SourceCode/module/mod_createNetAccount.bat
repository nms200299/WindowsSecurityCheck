@echo off
if not exist "./module/tmp/netAccount.txt" (
	net accounts > ./module/tmp/netAccount.txt
)
rem ���� ������ �������� ������ ���� ���� ����