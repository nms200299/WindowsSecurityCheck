@echo off
if not exist "./tmp/securityPolicy.txt" (
	secedit /export /cfg ./tmp/securityPolicy.txt
)
rem 설정 파일이 존재하지 않으면 설정 파일 생성