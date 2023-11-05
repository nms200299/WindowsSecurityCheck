@echo off
setlocal enabledelayedexpansion
set "logFileName=%date%_%time%.log"
set "logFileName=!logFileName::=.!"
call "./module/script/W01.bat" >> ".\log\%logFileName%"
pause