@echo off
echo ###################################################################################
echo [W02] �������� - Guest ���� ����
echo.

echo �� ���� ����
echo 	��ȣ : Guest ������ ��Ȱ��ȭ �Ǿ� ����.
echo 	��� : Guest ������ Ȱ��ȭ �Ǿ� ����.
echo.
echo.

echo �� ���� ���
net user guest | find "Ȱ�� ����" | find "��"
if %errorlevel% EQU 0 (
	echo 	�� ��� ^(Guest ������ Ȱ��ȭ ��^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> LUSRMGR.MSC -^> ����� -^> GUEST -^> '�Ϲ�' ��
	echo 	Step2^) "���� ��� �� ��"�� üũ
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(Guest ������ Ȱ��ȭ ���� ����^)
	call %CHK_FILE% SAFE %1
)
echo.
echo.