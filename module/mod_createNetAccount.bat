@echo off
if not exist "./module/tmp/netAccount.txt" (
	net accounts > ./module/tmp/netAccount.txt
)
rem 설정 파일이 존재하지 않으면 설정 파일 생성