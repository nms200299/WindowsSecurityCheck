@echo off
echo W-38 START
echo.
echo [W38] ȭ�麸ȣ�� ����
echo.
echo �� ���� ��Ȳ

setlocal enabledelayedexpansion


reg query "HKEY_CURRENT_USER\Control Panel\Desktop" | find /i "ScreenSaveActive" | find "1" > nul
if %errorlevel% NEQ 0 (
    echo �� ���: ����
    echo �� ��ġ ���: ������ - ���÷��� - ȭ�麸ȣ�⺯�� - ȭ�� ��ȣ�� ���
) else (
    reg query "HKEY_CURRENT_USER\Control Panel\Desktop" | find /i "ScreenSaverIsSecure" | find "1" > nul
    if !ERRORLEVEL! NEQ 0 (
        echo �� ���: ����
        echo �� ��ġ ���: ������ - ���÷��� - ȭ�麸ȣ�⺯�� - �ٽ� ������ �� �α׿� ǥ�� üũ
    ) else (
        for /F "tokens=3" %%a in ('reg query "HKEY_CURRENT_USER\Control Panel\Desktop" ^| find /i "ScreenSaveTimeOut"') do (
            set /a timeout=%%a
            if !timeout! GTR 600 (
                echo �� ���: ����
                echo �� ��ġ ���: ������ - ���÷��� - ȭ�麸ȣ�⺯�� - ��� �ð� ����
                echo ��� �ð��� 600�� �̻����� �����Ǿ� ����
            ) else (
                echo �� ���: ����
                echo �� ��� �ð� ����: !timeout! ��
            )
        )
    )
)

endlocal
