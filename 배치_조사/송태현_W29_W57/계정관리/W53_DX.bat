@echo off
setlocal enabledelayedexpansion

echo W-53 START
echo.
echo [W53] ���� �α׿� ���
echo.
echo �� ���� ��Ȳ

for /f "tokens=3" %%A in ('find /i "SeInteractiveLogonRight" LocalSecurityPolicy.txt') do (
    set "SeInteractiveLogonRight=%%A"
)

echo %SeInteractiveLogonRight%

echo %SeInteractiveLogonRight% | findstr /C:"*S-1-5-32-544" /C:"*S-1-5-32-568" >nul
if %errorlevel% equ 1 (
    echo �� ���: ����
	echo �� ��ġ ���
	echo Step 1. ���� - ���� - SECPOL.MSC - ���� ��å - ����� ���� �Ҵ�
    echo Step 2. "���� �α׿� ���(�Ǵ�, ���� �α׿�)" ��å�� "Adminstrators", "IUSR_" �� �ٸ� ���� �� �׷� ����
	
) else (
    echo �� ���: ����
)

endlocal