@echo off

echo. W-61 SNMP ���� Ŀ�´�Ƽ��Ʈ���� ���⼺ ����
echo.
echo [ W-61 "SNMP ���� Ŀ�´�Ƽ��Ʈ���� ���⼺ ����" ]
echo.
net start | find /I "SNMP"
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo ���� Ȯ�� �ʿ�
    echo.
    echo Step 1 ���� - ���� - SERVICES.MSC - SNMP Service �Ǵ�, SNMP ���� - �Ӽ� - ���� - [���� Ʈ�� ������] �Ʒ� [�߰�] ��ư
    echo Step 2 [SNMP ���� ����] - ���� ������ �ʿ����� �ʴٸ� Ŀ�´�Ƽ �̸��� �б� �������� Public/Private�� �ƴ� �̸��� �߰�
    echo Step 3 ���ʿ� �� �ش� ���� ����
    echo ���� - ���� - SERVICES.MSC - SNMP Service �Ǵ�, SNMP ���� - �Ӽ� [�Ϲ�] �ǿ��� ������ �������� ����� �� �ԡ����� ������ ��, SNMP ���� ����
)