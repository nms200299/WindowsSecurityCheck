@echo off
if not exist "./tmp/netAccount.txt" (
	net accounts > ./tmp/netAccount.txt
)
rem 설정 파일이 존재하지 않으면 설정 파일 생성