@echo off
echo ###########################################################

echo #                  pc check를 시작하겠습니다              #

echo ###########################################################

pause


setlocal 

set flags = 0

set name = 0 


echo [1.1 administrator 계정 이름 바꾸기]


echo ■ 기준
echo 양호 :  Administrator 이름의 계정이 존재함
echo 취약 :  Administrator 이름의 계정이 존재하지 않음
 

echo ■ 결과 
net user > account.txt 

type account.txt | find/i  "Administrator"
if errorlevel 1 echo [양호] Administrator 계정이 존재하지 않음 
if not errorlevel 1 echo [취약] Administrator 계정이 존재함 

 

echo ■ 조치 
if not errorlevel 1 echo 어드민 계정이 발견 되었습니다.  
if not errorlevel 1 set /p flag="admin 계정이름을 변경 하시겠습니까? <Y/N>"
if /i "%flag%" =="y" (set /p name="변경할 계정이름을 입력해 주세요 :") 
if /i "%flag%" =="y" (wmic useraccount where name='Administrator' call rename "%name%")
if /i "%flag%" =="y" echo 계정이름이 "%name%"으로 변경 되었습니다.

if errorlevel 0 echo 어드민 계정이 없습니다 [안전]