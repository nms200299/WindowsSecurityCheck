@echo off

echo. W-69 ��å�� ���� �ý��� �α� ����
echo.
echo [ W-69 "��å�� ���� �ý��� �α� ����" ]
echo.
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditLogonEvents"
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditPrivilegeUse"
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditPolicyChange"
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditAccountManage"
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditDSAccess"
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditAccountLogon"
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step Step 1 ����> ����> SECPOL.MSC> ���� ��å> ���� ��å
    echo �α׿� �̺�Ʈ, ���� �α׿� �̺�Ʈ, ��å ���� : ����/���� ����
    echo ���� ����, ���丮 ���� �׼���, ���� ��� : ���� ����
)