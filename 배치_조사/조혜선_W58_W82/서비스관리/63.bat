@echo off

echo. W-63 DNS ���� ���� ����
echo.
echo [ W-63 "DNS ���� ���� ����" ]
echo.
net start | find /I "DNS Server"                                 
net start | find /I "DNS Server"                                   
net start | find /I "DNS Client"                            
net start | find /I "DNS Client"
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 ���� - ���� - DNSMGMT.MSC - �� ��ȸ ���� - �ش� ���� - �Ӽ� - �Ϲ�
    echo Step 2 ���� ������Ʈ �� ���� �Ǵ� �ƴϿ� ����
    echo Step 3 ���ʿ� �� �ش� ���� ���� ���� - ���� - SERVICES.MSC - DNS ���� - �Ӽ� [�Ϲ�] �ǿ��� "���� ����"�� "��� �� ��"���� ������ ��, DNS ���� ����
)