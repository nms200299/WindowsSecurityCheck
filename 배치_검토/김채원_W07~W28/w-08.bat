@echo off
echo ###################################################################################
echo [W08] ���� ���� - �ϵ��ũ �⺻ ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  �ϵ��ũ �⺻ ������ �������� ����
echo 	��� :  �ϵ��ũ �⺻ ������ ����
echo.
echo.

echo �� ���� �����
net share | findstr /r /c:"^[CDEFGHIJKLMNOPQRSTUVWXYZ]\$$" >nul
if errorlevel 1 (
    echo ��ȣ: �ϵ��ũ �⺻ ������ ���ŵǾ� �ֽ��ϴ�.
) else (
    echo ���: �ϵ��ũ �⺻ ������ �����մϴ�.
)

echo �� ��ġ ���
echo step 1) ���� ^> ���� ^> FSMGMT.MSC ^> ���� ^> �⺻ ���� ���� ^> ���콺 ��Ŭ�� ^> ���� ����
echo  step 2) ���� ^> ���� ^> REGEDIT �ش� ������Ʈ�� �� 0���� ����
echo ��� �� �������� : "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareServer"

echo.
echo.
pause