@echo off
echo ###################################################################################
echo [W08] ���� ���� - �ϵ��ũ �⺻ ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  AutoShareServer ������Ʈ�� ���� 0�̸�, �⺻ ������ �������� ����.
echo 	��� :  AutoShareServer ������Ʈ�� ���� 1�̰ų�, �⺻ ������ ������.
echo.
echo.

echo �� ���� ���
set flag=0
net share | findstr /R "^[A-Z]\$"
if errorlevel 1 (
    echo    step 1^) �ϵ��ũ �⺻ ������ ���ŵǾ� �ֽ��ϴ�. ^(��ȣ^)
) else (
    echo    step 1^) �ϵ��ũ �⺻ ������ �����մϴ�. ^(���^)
    set flag=1
)

set KeyName=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters
set ValueName=AutoShareServer
reg query %KeyName% /v %ValueName% 2>nul
if errorlevel 1 (
    echo    step 2^) AutoShareServer ������Ʈ���� �����ϴ�. ^(��ȣ^)
) else (
    for /f "tokens=2*" %%a in ('reg query %KeyName% /v %ValueName%') do set RegValue=%%b

    if !RegValue! EQU 0 (
        echo    step 2^) AutoShareServer ������Ʈ�� ���� 0�Դϴ�. ^(��ȣ^)
    ) else if !RegValue! EQU 1 (
        echo    step 2^) AutoShareServer ������Ʈ�� ���� 1�Դϴ�. ^(���^)
        set flag=1
    )

)

if !flag! EQU 1 (
    echo    �� ��� ^(�� ���뿡 ���� �ϳ� �̻��� �׸��� ����մϴ�^)
    echo.
    echo.
    echo �� ��ġ ���
    echo    step 1^) ���� ^> ���� ^> FSMGMT.MSC ^> ���� ^> �⺻ ���� ���� ^> ���콺 ��Ŭ�� ^> ���� ����
    echo    step 2^) ���� ^> ���� ^> REGEDIT �ش� ������Ʈ�� �� 0���� ����
    echo    ��� �� �������� : "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareServer"
    call %CHK_FILE% PWN %1
) else (
    echo    �� ��ȣ ^(�� ���뿡 ���� �ϳ� ��ȣ�մϴ�^)
    call %CHK_FILE% SAFE %1
)

echo.
echo.
