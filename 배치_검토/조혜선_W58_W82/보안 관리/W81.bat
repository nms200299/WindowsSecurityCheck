@echo off

echo. W-81 �������α׷� ��� �м�
echo.
echo [ W-81 "�������α׷� ��� �м�" ]
echo.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\Windows\CurrentVersion\Run"    			  
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 Windows 2012 ���� ���� ������ ��� �������α׷� ��� ������ �Ұ����ϸ� ������ �����̳� ����� ���ؼ��� ��ġ�����̳� ������Ʈ�� �� �߰��� �̿��ؼ� ����ȭ�� ���� ����� �� ������ ���Ȼ� �������� ����
)