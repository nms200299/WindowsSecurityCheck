@echo off
echo ###################################################################################
echo [W61] ���� ���� - SNMP ���� Ŀ�´�Ƽ��Ʈ���� ���⼺ ����
echo.

echo �� ���� ����
echo 	��ȣ : SNMP ���񽺸� ������� �ʰų� Community String�� public, private�� �ƴ�.
echo 	��� : SNMP ���񽺸� ����ϸ�, Community String�� public, private�� ������.
echo.
echo.

echo �� ���� ���
net start | find /I "SNMP"
if %errorlevel% EQU 0 (
	echo 	�� ��ȣ ^(SNMP ���񽺸� ������� ����^)
    call %CHK_FILE% SAFE %1
) else (
	echo 	�� ��� ^(SNMP ���񽺸� �����^)
    echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SERVICES.MSC -^> SNMP Service �Ǵ�, SNMP ����  �Ӽ� -^> ���� -^> '���� Ʈ�� ������' �Ʒ� '�߰�' ��ư
	echo    Step2^) 'SNMP ���� ����' -^> ���� ������ �ʿ����� �ʴٸ� Ŀ�´�Ƽ �̸��� �б� �������� Public/Private�� �ƴ� �̸��� �߰�
    echo    Step3^) ���� -^> ���� -^> SERVICES.MSC> SNMP Service �Ǵ�, SNMP ���� -^> �Ӽ� -^> '�Ϲ�' �ǿ��� ������ �������� ����� �� �ԡ����� ������ ��, SNMP ���� ����
    call %CHK_FILE% PWN %1
)
echo.
echo.