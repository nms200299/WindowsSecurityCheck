@echo off

echo. W-58 �͹̳� ���� ��ȣȭ ���� ����
echo.
echo [ W-58 "�͹̳� ���� ��ȣȭ ���� ����" ]
echo.
net start | find /I "Remote Desktop Services"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" | find /I "MinEncryptionLevel"
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 ����> ���� - GPEDIT.MSC : ���� �׷� ��å ������
    echo Step 2 ��ǻ�� ����- ���� ���ø�- Windows ���� ���> �͹̳� ����> ���� ����ũ�� ���� ȣ��Ʈ > ����
    echo Step 3 "Ŭ���̾�Ʈ ���� ��ȣȭ ���� ����" - "��ȣȭ ����"�� Ŭ���̾�Ʈ ȣȯ �������� ����
)