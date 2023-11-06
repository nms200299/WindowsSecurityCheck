@echo off
if not exist "./module/tmp/securityPolicy.txt" (
	secedit /export /cfg ./module/tmp/securityPolicy.txt > NUL
)
rem 설정 파일이 존재하지 않으면 설정 파일 생성