@echo off
echo. W-63 DNS ���� ���� ����
echo.
echo [ W-63 "DNS ���� ���� ����" ]
echo.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones\dx" | find /v 1
if errorlevel 1 (
echo �� ���: ��ȣ
) else (
echo �� ���: ���
echo �� ��ġ ���
echo Step 1 DNS ������'dnsmgmt.msc' - �� ��ȸ ���� - �Ӽ� - '���� ������Ʈ' ���� Ȯ��
)