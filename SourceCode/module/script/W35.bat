@echo off
setlocal enabledelayedexpansion

echo W-35 START
echo.
echo [W35] �������� �׼��� �� �� �ִ� ������Ʈ�� ���
echo.
echo �� ���� ��Ȳ

net start | find /I "Remote Registry" > nul
if !errorlevel! EQU 0 (
    echo �� ���: ����
    echo �� ��ġ ���
	echo Step 1. ���� - ���� - SERVICES.MSC - Remote Registry - �Ӽ�
    echo Step 2. ���� ���� - ��� ����
	echo Step 3. ���� ���� - ����

) else (
    echo �� ���: ����
)

endlocal
