@echo off
echo. W-67 �����͹̳� ���� Ÿ�Ӿƿ� ����
echo.
echo [ W-67 "�����͹̳� ���� Ÿ�Ӿƿ� ����" ]
echo.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" | findstr /I "MaxIdleTime" > nul
echo.
if not errorlevel 1 (
    echo �� ���: ��ȣ
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1: ���� - ���� - GPEDIT.MSC[���� �׷� ��å ������]
    echo Step 2: ��ǻ�� ���� - ���� ���ø� - Windows ���� ��� - �͹̳� ���� - ���� ����ũ�鼼�� ȣ��Ʈ - ���� �ð� ����
    echo Step 3: [Ȱ�� �������� ���� �͹̳� ���� ���ǿ� �ð����� ����] - [���� ���� ����]�� "30��"���� ����
)