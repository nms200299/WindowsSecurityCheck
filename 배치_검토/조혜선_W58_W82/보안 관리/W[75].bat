@echo off

echo. W-75 ��� �޽��� ����
echo.
echo [ W-75 "��� �޽��� ����" ]
echo.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system"
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
    echo Step 2 ��ȭ�� �α׿�: �α׿� �õ��ϴ� ����ڿ� ���� �޽��� ����: ��� ���� �Է�
    echo Step 3 ��ȭ�� �α׿�: �α׿� �õ��ϴ� ����ڿ� ���� �޽��� �ؽ�Ʈ: ��� ���� �Է�
)