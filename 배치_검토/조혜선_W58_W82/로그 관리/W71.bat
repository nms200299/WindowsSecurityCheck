@echo off

echo. W-71 ���ݿ��� �̺�Ʈ �α� ���� ���� ����
echo.
echo [ W-71 "���ݿ��� �̺�Ʈ �α� ���� ���� ���� " ]
echo.
icacls %systemroot%\system32\Winevt\Logs | find /v "������ ó��������"                             
icacls %systemroot%\system32\config | find /v "������ ó��������"  
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 Ž���� - �α� ���͸� - �Ӽ� - ����
    echo Step 2 Everyone ���� ����
)