@echo off
echo ###################################################################################
echo [W53] ���� ���� - ���� �α׿� ���
echo.

echo �� ���� ����
echo 	��ȣ :  ���� �α׿� ��� ��å�� Administrators, IUSR_ �� �����ϴ� ���
echo 	��� :  ���� �α׿� ��� ��å�� Administrators, IUSR_ �� �ٸ� ���� �� �׷��� �����ϴ� ���
echo 	���� :  ���α׷��� ���� �Ǵ��� �� ����.
echo.
echo.

echo �� ���� �����
for /f "tokens=3" %%A in ('find /i "SeInteractiveLogonRight" ../tmp/securityPolicy.txt') do (
    set "SeInteractiveLogonRight=%%A"
)
rem "����� �� �����߽��ϴ�." ���ڸ� ���� ���
echo 	�� ���� ^(�Ǵ� �Ұ�^)
echo.
echo.

echo �� ��ġ ���
echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ����� ���� �Ҵ�
echo 	Step2^) "���� �α׿� ���(�Ǵ�, ���� �α׿�)" ��å�� "Adminstrators", "IUSR_" �� �ٸ� ���� �� �׷� ����
call %CHK_FILE% WARN %1
echo.
echo.