@echo off

echo. W-76 ����ں� Ȩ ���͸� ���� ����
echo.
echo [ W-76 "����ں� Ȩ ���͸� ���� ����" ]
echo.
icacls C:\Users\* | find /v "������ ó��������"
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 C:\�����\<����� ����>
    echo Step 2 �ش� ����ڿ� ���� ���� �� �Ϲ� ���� ����
)