@echo off

echo [W-06] 관리자 그룹에 최소한의 사용자 포함

echo.

net localgroup Administrators | find /v "명령을" | find /v "설명"