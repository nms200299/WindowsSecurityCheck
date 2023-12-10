@echo off
echo ###################################################################################
echo [W29] ���� ���� - DNS Zone Transfer ����
echo.

echo �� ���� ����
echo 	��ȣ :  DNS ���񽺸� ������� �ʴ� ��� , ���� ���� ����� ���� �ʴ� ��� , Ư�� �����θ� ������ �Ǿ� �ִ� ���
echo 	��� :  �� 3���� ���� �� �ϳ��� �ش� ���� �ʴ� ���
echo.
echo.

echo �� ���� ���

net start | findstr /C:"DNS Server"
if not errorlevel 1 (
	reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server"
	if not errorlevel 1 (
		reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s 2>nul | find "SecureSecondaries" | find "0x2"
		rem 0�̸� �ƹ� ����,
		rem 1�̸� �̸� ����
		rem 2�� ���� ����
		rem 3�̸� ���� ���� ������� ����
		if not errorlevel 1 (
			echo 	�� ��ȣ ^(DNS Zone Transfer ������^)
			call %CHK_FILE% SAFE %1
		) else (
			reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s 2>nul | find "SecureSecondaries" | find "0x3"
			if not errorlevel 1 (
				echo 	�� ��ȣ ^(���� ������ ������� ����^)
				call %CHK_FILE% SAFE %1
			) else (
				echo 	�� ��� ^(���� �����θ� ������ �Ǿ� ���� ����^)
				echo.
				echo.
				echo �� ��ġ ���
				echo 	Step1^) ���� -^> ���� -^> DNSMGNT.MSC -^> �� ��ȸ ���� -^> �ش� ���� -^> �Ӽ� -^> ���� ����
				echo 	Step2^) "���� �����θ�" ���� -^> ������ ���� IP �߰�
				call %CHK_FILE% PWN %1
			)

		)
	) else (
		echo 	�� ��ȣ ^(DNS ������ ������� ����^)
		call %CHK_FILE% SAFE %1
	)
) else (
	echo 	�� ��ȣ ^(DNS ������ ������� ����^)
	call %CHK_FILE% SAFE %1
)

echo.
echo.



