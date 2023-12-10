@echo off
echo ###################################################################################
echo [W22] ���� ���� - IIS Exec ��ɾ� �� ȣ�� ����
echo.

echo �� ���� ����
echo 	��ȣ :  IIS 5.0 �������� �ش� ������Ʈ�� ���� 0�̰ų�, IIS 6.0 ���� �̻�.
echo 	��� :  IIS 5.0 �������� �ش� ������Ʈ�� ���� 1�� �� ����.
echo.
echo.

echo �� ���� �����
for /f "tokens=2 delims=[]" %%A in ('ver') do (
    for /f "tokens=2" %%B in ("%%A") do (
        set "version_number=%%B"
    )
)

echo OS ���� : %version_number%
for /f "tokens=1-2 delims=." %%a in ("%version_number%") do (
	if %%a LSS 6 (
		echo 3
		if %%a EQU 5 (
			if %%b LSS 2 (
				echo    �� ��� ^(IIS 5.0^(Windows 2000^) ���� ���������� Ȯ���� �ʿ��մϴ�^)
				goto WARN
			) else (
				echo    �� ��ȣ ^(IIS 6.0^(Windows 2003^) �̻� ���� �ش� ���� ����^)
				goto SAFE
			)
		) else (
			echo    �� ��� ^(IIS 5.0^(Windows 2000^) ���� ���������� Ȯ���� �ʿ��մϴ�^)
			goto WARN
		)
	) else (
		echo    �� ��ȣ ^(IIS 6.0^(Windows 2003^) �̻� ���� �ش� ���� ����^)
		goto SAFE
	)
)

:WARN
echo.
echo.
echo �� ��ġ ���
echo    IIS 5.0^(Windows 2000^) ���� ������ �Ʒ��� ���� ��ġ.
echo    step 1^) ���� -^> ���� -^> REGEDIT -^> HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters �˻�
echo    step 2^) DWORD -^> SSIEnableCmdDirective ���� ã�� ���� "0"���� �Է�
call %CHK_FILE% WARN %1
goto CONTINUE

:SAFE
call %CHK_FILE% SAFE %1

:CONTINUE
echo.
echo.