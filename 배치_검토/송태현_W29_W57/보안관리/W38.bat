@echo off
echo ###################################################################################
echo [W38] ���� ���� - ȭ�麸ȣ�� ����
echo.

echo �� ���� ����
echo 	��ȣ : ȭ�� ��ȣ�⸦ �����ϰ� ��� �ð��� 10�� ������ ������ �����Ǿ� ������, ȭ�� ��ȣ�� ������ ���� ��ȣ�� ����ϴ� ���
echo 	��� : ȭ�� ��ȣ�Ⱑ �������� �ʾҰų� ��ȣ�� ������� ���� ��� �Ǵ�, ȭ�� ��ȣ�� ��� �ð��� 10���� �ʰ��� ������ �����Ǿ� �ִ� ���
echo.
echo.


echo �� ���� ���
reg query "HKEY_CURRENT_USER\Control Panel\Desktop" | find /i "ScreenSaveActive" | find "1" > nul
if %errorlevel% NEQ 0 (
    echo  	�� ��� ^(ȭ�� ��ȣ�� ��� �ȵ�^)
    echo �� ��ġ ���
	echo 	Step1^) ������ -^> ���÷��� -^> ȭ�麸ȣ�⺯�� -^> ȭ�� ��ȣ�� ���
) else (
    reg query "HKEY_CURRENT_USER\Control Panel\Desktop" | find /i "ScreenSaverIsSecure" | find "1" > nul
    if %errorlevel% NEQ 0 (
        echo  	�� ��� ^(�ٽ� ������ �� �α׿� ǥ�� �ȵ�^)
		echo �� ��ġ ���
		echo 	Step1^) ������ -^> ���÷��� -^> ȭ�麸ȣ�⺯�� -^> �ٽ� ������ �� �α׿� ǥ�� üũ
		call %CHK_FILE% PWN %1
    ) else (
        for /F "tokens=3" %%a in ('reg query "HKEY_CURRENT_USER\Control Panel\Desktop" ^| find /i "ScreenSaveTimeOut"') do (
            set /a timeout=%%a
            if %timeout% GTR 600 (
				echo  	�� ��� ^(��� �ð��� 10���̻�^)
				echo �� ��ġ ���
				echo 	������ -^> ���÷��� -^> ȭ�麸ȣ�⺯�� -^> ��� �ð� ���� -^> 10������ ����
				call %CHK_FILE% PWN %1
            ) else (
                echo 	�� ��ȣ ^(ȭ�� ��ȣ�⸦ �����ϰ� ��� �ð��� 10�� ������ ������ �����Ǿ� ������, ȭ�� ��ȣ�� ������ ���� ��ȣ�� ����ϴ� ���^)
				call %CHK_FILE% SAFE %1
            )
        )
    )
)

echo.
echo.

