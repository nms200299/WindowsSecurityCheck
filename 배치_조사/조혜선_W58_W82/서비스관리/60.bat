@echo off

echo. W-60 SNMP ���� ���� ����
echo.
echo [ W-60 "SNMP ���� ���� ����" ]
echo.
net start | find /I "SNMP"
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 ���ʿ� �� �ش� ���� ����
    echo ����- ����- SERVICES.MSC - SNMP Service �Ǵ�, SNMP ����- �Ӽ����� ������ �������� ����� �� �ԡ����� ������ ��, SNMP ���񽺸� ������
)