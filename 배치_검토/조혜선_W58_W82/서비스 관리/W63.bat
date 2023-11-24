@echo off
echo ###################################################################################
echo [W63] ���� ���� - DNS ���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ : DNS ���񽺸� ������� �ʰų� ���� ������Ʈ ������ �Ǵ� �ƴϿ������� �����Ǿ� ����.
echo 	��� : ���񽺸� ����ϸ� ���� ������Ʈ�� �����Ǿ� ����.
echo.
echo.

echo �� ���� ���
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\dx" | find /v 1
if %errorlevel% EQU 0 (
	echo 	�� ��ȣ ^(DNS ���񽺸� ������� �ʰų� ���� ������Ʈ ������ �Ǵ� �ƴϿ������� ������^)
	call %CHK_FILE% SAFE %1
) else (
	echo 	�� ��� ^(���񽺸� ����ϸ� ���� ������Ʈ�� ������^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> DNSMGMT.MSC -^> �� ��ȸ ���� -^> �ش� ���� -^> �Ӽ� -^> �Ϲ�
	echo 	Step2^) ���� ������Ʈ �� ���� �Ǵ�, �ƴϿ� ����
    echo    Step3^) ���� -^> ���� -^> SERVICES.MSC -^> DNS ���� -^> �Ӽ� '�Ϲ�' �ǿ��� "���� ����"�� "��� �� ��"���� ������ ��, DNS ���� ����
	call %CHK_FILE% PWN %1
)
echo.
echo.