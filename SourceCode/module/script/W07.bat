@echo off

REM ���� ��å ���� ��ο� ���ϸ� ����
set "policyFile=C:\Users\T\Desktop\A\111"

REM LSAAnonymousNameLookup �� Ȯ��
for /f "tokens=2 delims==" %%B in ('type "%policyFile%" ^| findstr "LSAAnonymousNameLookup"') do (
    set "LSAAnonymousNameLookup=%%B"
)

REM ���� ���� �� ����� �׷� ���� Ȯ��
if "%LSAAnonymousNameLookup%" neq "0" (
    echo [���� ���� �� ����� �׷� ����]
    echo �� ���: ����
    echo.
    echo Step 1. ���� - ���� - fsmgmt.MSC - ���� ��å - ���� - everyone ����
    echo Step 2. "��Ʈ��ũ �׼���: ���� ���� �� ����� �׷� ����" ��å�� "��� �� ��"���� ����
    echo.
    pause
) else (
    echo [���� ���� �� ����� �׷� ����]
    echo �� ���: ����
    echo.
    pause
)