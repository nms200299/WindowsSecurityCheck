@echo off

echo W-32 START
echo.
echo [W32] �ֽ� HOT FIX ����
echo.
echo �� ���� ��Ȳ

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /s | find /I "AUOptions" | find "0" > nul
if %errorlevel% NEQ 0 (
    echo �� ���: ����
    echo �� ��ġ ���
		echo - ���� HOT FIX ���� -
		echo �Ʒ��� ��ġ ����Ʈ�� ��ȸ�Ͽ� ������ �ʿ��� ��ġ�� �����Ͽ� �������� ��ġ��
		echo - �ڵ� HOT FIX ���� -
		echo ������ - windows update
		echo - PMS -
		echo Agent�� ��ġ�Ͽ� �ڵ����� ������Ʈ �ǵ��� ����
) else (
    echo �� ���: ����
)