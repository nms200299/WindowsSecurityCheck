@echo off
if not exist "./tmp/netUser.txt" (
	net users > ./tmp/netUser.txt
)
rem 설정 파일이 존재하지 않으면 설정 파일 생성