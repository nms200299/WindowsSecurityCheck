@echo off
echo ###################################################################################
echo [W53] ���� ���� - ���� �α׿� ���
echo.

echo �� ���� ����
echo 	��ȣ :  ���� �α׿� ��� ��å�� Administrators, IUSR_ �� �����ϴ� ���
echo 	��� :  ���� �α׿� ��� ��å�� Administrators, IUSR_ �� �ٸ� ���� �� �׷��� �����ϴ� ���
echo 	���� :  ���α׷��� ���� �Ǵ��� �� ����.
echo.
echo.

echo �� ���� ���
set "flag=0"
call .\module\mod_createSecEdit.bat
for /F "tokens=1-5 delims=*" %%a in ('type .\module\tmp\securityPolicy.txt ^| find /i "SeInteractiveLogonRight"') do (
    echo %%b | findstr /C:"S-1-5-32-544" /C:"S-1-5-32-568" >nul
    if errorlevel 1 (
        set "flag=1"
    )
    rem ù ��° ������ S-1-5-32-544 �Ǵ� S-1-5-32-568�� �ƴϸ� ���

    echo %%c | findstr /C:"S-1-5-32-544" /C:"S-1-5-32-568" >nul
    if errorlevel 1 (
        echo %%c | findstr /C:"S" > nul
        if not errorlevel 1 (
            set "flag=1"
        )
    )
    rem �� ��° ������ S-1-5-32-544 �Ǵ� S-1-5-32-568�� �ƴϸ� ���

    echo %%d | findstr /C:"S" > nul
    if not errorlevel 1 (
        set "flag=1"
    )
    rem �� ��° ������ S ���ڰ� ��������� ���
)


if !flag! EQU 1 (
    echo    �� ��� ^(���� �α׿� ��� ��å�� Administrators, IUSR_ �� �ٸ� ���� �� �׷��� ����^)
    echo.
    echo.
    echo �� ��ġ ���
    echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ����� ���� �Ҵ�
    echo 	Step2^) "���� �α׿� ���(�Ǵ�, ���� �α׿�)" ��å�� "Adminstrators", "IUSR_" �� �ٸ� ���� �� �׷� ����
    call %CHK_FILE% PWN %1
) else (
    echo    �� ��ȣ ^(���� �α׿� ��� ��å�� Administrators, IUSR_ �� ����^)
    call %CHK_FILE% SAFE %1
)

echo.
echo.