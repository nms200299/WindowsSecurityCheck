@echo off
echo ###################################################################################
echo [W29] ���� ���� - DNS Zone Transfer ����
echo.

echo �� ���� ����
echo 	��ȣ :  DNS �������� ������� �ʴ� ��� , ���� ���� ����� ���� �ʴ� ��� , Ư�� �����θ� ������ �Ǿ� �ִ� ���
echo 	��� :  �� 3���� ���� �� �ϳ��� �ش� ���� �ʴ� ���
echo.
echo.

echo �� ���� ���
rem 0�̸� �ƹ����� 1,2�� Ư�� ���� �̹Ƿ� 0�� ã��
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s 2>nul | find "SecureSecondaries" | find "0x0"
if errorlevel 1 (
		echo 	�� ��ȣ ^(DNS Zone Transfer ������^)
		call %CHK_FILE% SAFE %1
    ) else (
		echo 	�� ��� ^(Ư�� �����θ� ������ �Ǿ� ���� ����^)
		echo �� ��ġ ���
		echo 	Step1^) ���� -^> ���� -^> DNSMGNT.MSC -^> �� ��ȸ ���� -^> �ش� ���� -^> �Ӽ� -^> ���� ����
		echo 	Step2^) "���� �����θ�" ���� -^> ������ ���� IP �߰�
		echo.
		echo.
		call %CHK_FILE% PWN %1
	    )
echo.
echo.



