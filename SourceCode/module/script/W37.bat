@echo off
echo W-37 START
echo.
echo [W37] SAM ���� ���� ���� ����
echo.
echo �� ���� ��Ȳ
icacls %systemroot%\system32\config\SAM | findstr /V /C:"SYSTEM" /C:"Administrator" /C:"NT AUTHORITY\SYSTEM" /C:"BUILTIN\Administrators" | FIND ":(F)" > nul
if %errorlevel% equ 0 (
    echo �� ��� : ����
    echo �� ��ġ ���
    echo Step 1. %systemroot%\system32\config\SAM - �Ӽ� - ����
    echo Step 2. Administratirm system �׷� �� �ٸ� ����� �� �׷� ���� ����
) else (
    echo �� ��� : ����
)
