@echo off

echo. W-70 �̺�Ʈ �α� ���� ����
echo.
echo [ W-70 "�̺�Ʈ �α� ���� ����" ]
echo.
echo. # �������α׷� Ȯ�� #                                                                          
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application" | find /I "MaxSize"     
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application" | find /I "Retention"   
echo. # �ý��� Ȯ�� #                                                                               
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\System" | find /I "MaxSize"          
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\System" | find /I "Retention"       
echo. # ���� Ȯ�� #                                                                               
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security" | find /I "MaxSize"        
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security" | find /I "Retention" 
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 ���� - ���� - EVENTVWR.MSC - �ش� �α� - �Ӽ� - �Ϲ�
    echo Step 2 �ִ� �α� ũ�� �� 10240KB
)