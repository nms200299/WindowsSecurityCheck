@echo off
if not exist "./tmp/netAccount.txt" (
	net accounts > ./tmp/netAccount.txt
)
rem ���� ������ �������� ������ ���� ���� ����