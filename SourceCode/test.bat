@echo off
setlocal enabledelayedexpansion

set "result="
for /f "delims=" %%a in ('net accounts') do (
	set "result=!result!%%a"
)

echo !result!
pause