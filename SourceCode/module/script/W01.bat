@echo off
echo ###########################################################

echo #                  pc check�� �����ϰڽ��ϴ�              #

echo ###########################################################

pause


setlocal 

set flags = 0

set name = 0 


echo [1.1 administrator ���� �̸� �ٲٱ�]


echo �� ����
echo ��ȣ :  Administrator �̸��� ������ ������
echo ��� :  Administrator �̸��� ������ �������� ����
 

echo �� ��� 
net user > account.txt 

type account.txt | find/i  "Administrator"
if errorlevel 1 echo [��ȣ] Administrator ������ �������� ���� 
if not errorlevel 1 echo [���] Administrator ������ ������ 

 

echo �� ��ġ 
if not errorlevel 1 echo ���� ������ �߰� �Ǿ����ϴ�.  
if not errorlevel 1 set /p flag="admin �����̸��� ���� �Ͻðڽ��ϱ�? <Y/N>"
if /i "%flag%" =="y" (set /p name="������ �����̸��� �Է��� �ּ��� :") 
if /i "%flag%" =="y" (wmic useraccount where name='Administrator' call rename "%name%")
if /i "%flag%" =="y" echo �����̸��� "%name%"���� ���� �Ǿ����ϴ�.

if errorlevel 0 echo ���� ������ �����ϴ� [����]