@echo off
echo ###################################################################################
echo [W01] Administrator ���� �̸� �ٲٱ�
echo.

echo �� ���� ����
echo 	��ȣ :  Administrator �̸��� ������ �������� ����.
echo 	��� :  Administrator �̸��� ������ ������.
echo.
echo.

echo �� ���� �����
net users | find /i "Administrator"
rem ��ҹ��� ������� ��
rem (Administrator���� administrator���� �����Ѵٰ� ���߰� ����� ���� �ƴ�����.)

if %errorlevel% EQU 0 (
	echo 	�� ��� ^(Administrator ������ �߰ߵ�^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���α׷� -^> ������ -^> �������� -^> ���� ���� ��å -^> ���� ��å -^> ���ȿɼ�
	echo 	Step2^) "����: Administrator ���� �̸� �ٲٱ�"�� �����ϱ� ����� ���� �̸����� ����
) else (
	echo 	�� ���� ^(Administrator ������ �߰ߵ��� ����^)
)
echo.
echo.


