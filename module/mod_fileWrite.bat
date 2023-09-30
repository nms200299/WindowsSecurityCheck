@echo off
chcp 65001>nul
rem UTF-8 인코딩을 인식할 수 있도록 변경


setlocal enabledelayedexpansion
rem 지연된 확장 모드 활성화
set input_str=%3
set "input_str=!input_str:"=!"
set "input_str=!input_str:<=^<!"
set "input_str=!input_str:>=^>!"
rem 쌍따옴표와 꺽쇠를 이스케이프 처리

if "%2" EQU "append" (
	echo %input_str%>>%1
	rem 파일 수정
) else if "%2" EQU "appendNULL" (
	echo.>>%1
	rem 파일 생성
) else if "%2" EQU "write" (
	echo %input_str%>%1
	rem 파일 생성
) else if "%2" EQU "startHTML" (
	setlocal disabledelayedexpansion
	echo ^<!DOCTYPE HTML^>>%1
)