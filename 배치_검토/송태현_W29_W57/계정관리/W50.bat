@echo off
echo ###################################################################################
echo [W50] ���� ���� - �н����� �ִ� ��� �Ⱓ
echo.

echo �� ���� ����
echo 	��ȣ : �ִ� ��ȣ ��� �Ⱓ�� 90�� ���Ϸ� �����Ǿ� �ִ� ���
echo 	��� : �ִ� ��ȣ ��� �Ⱓ�� �������� �ʾҰų� 90���� �ʰ��ϴ� ������ ������ ���
echo.
echo.

echo �� ���� ���
for /f "tokens=3" %%A in ('find /i "MaximumPasswordAge" ../tmp/securityPolicy.txt') do (
    set "MaximumPasswordAge=%%A"
)

if %MaximumPasswordAge% gtr 90 (
	echo 	�� ��� ^(�ִ� ��ȣ ��� �Ⱓ�� �������� �ʾҰų� 90���� �ʰ��ϴ� ������ ������ ���^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ��ȣ ��å
	echo 	Step2^) "�ִ� ��ȣ ��� �Ⱓ"�� "��� �Ⱓ"�� "90��"�� ����
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(�ִ� ��ȣ ��� �Ⱓ�� 90�� ���Ϸ� �����Ǿ� �ִ� ���^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.