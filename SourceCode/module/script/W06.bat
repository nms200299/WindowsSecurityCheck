@echo off
echo ###################################################################################
echo [W06] �������� - ������ �׷쿡 �ּ����� ����� ����
echo.

echo �� ���� ����
echo 	��ȣ : Administrators �׷��� �������� 1�� ���Ϸ� �����ϰų�,
echo			���ʿ��� ������ ������ �������� ����.
echo 	��� : Administrators �׷쿡 ���ʿ��� ������ ������ ������.
echo 	���� :  ���α׷��� ���� �Ǵ��� �� ����.
echo.
echo.

echo �� ���� ���
net localgroup Administrators | find /v "����� �� �����߽��ϴ�."
rem "����� �� �����߽��ϴ�." ���ڸ� ���� ���
echo 	�� ���� ^(�Ǵ� �Ұ�^)
echo.
echo.

echo �� ��ġ ���
echo 	Step1^) ���� -^> ���� -^> LUSRMGR.MSC -^> �׷� -^> Administrators -^> �Ӽ�
echo 	Step2^) Administrators �׷쿡�� ���ʿ��� ���� ���� �� �׷� ����
call %CHK_FILE% WARN %1
echo.
echo.