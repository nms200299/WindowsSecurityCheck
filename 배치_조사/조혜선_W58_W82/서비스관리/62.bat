@echo off
echo W-62 SNMP Access control ����
echo.
echo [ W-62 "SNMP Access control ����" ]
echo.
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers /v 1 > nul
if not errorlevel 1 (
    echo �� ���: ��ȣ
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 : ���� - ���� - SERVICES.MSC - SNMP Service[�Ǵ�, SNMP ����] - �Ӽ� - ����
    echo Step 2 :"���� Ʈ�� ������" �� "���� ȣ��Ʈ�κ��� SNMP ��Ŷ �޾Ƶ��̱�" ����
    echo Step 3 : SNMP ȣ��Ʈ ���
)