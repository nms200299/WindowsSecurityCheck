@echo off

echo. W-66 ���ʿ��� ODBC/OLE-DB ������ �ҽ��� ����̺� ����
echo.
echo [ W-66 "���ʿ��� ODBC/OLE-DB ������ �ҽ��� ����̺� ����" ]
echo.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI"
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources"
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 ���� - ���� - ������ - ���� ���� - ODBC ������ ���� - �ý��� DSN - �ش� ����̺� Ŭ��
    echo Step 2 ������� �ʴ� ������ �ҽ� ����
)