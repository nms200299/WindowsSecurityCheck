@echo off
echo ###################################################################################
echo [W19] ���� ���� - IIS ���� ���丮 ����
echo.

echo �� ���� ����
echo    ��ȣ : �ش� �� ����Ʈ�� IIS Admin, IIS Adminpwd ���� ���丮�� �������� ����.
echo    ��� : �ش� �� ����Ʈ�� IIS Admin, IIS Adminpwd ���� ���丮�� ������ �� ����.
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
echo        ���� -^> ���� -^> INETMGR �Է� -^> �� ����Ʈ -^> IISAdmin, IISAdminpwd ���� -^> ���� 
call %CHK_FILE% WARN %1
goto CONTINUE

:SAFE
call %CHK_FILE% SAFE %1

:CONTINUE
echo.
echo.