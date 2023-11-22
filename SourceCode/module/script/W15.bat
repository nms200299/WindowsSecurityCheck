@echo off
echo ###################################################################################
echo [W15] ���� ���� - �� ���μ��� ���� ����
echo.

echo �� ���� ����
echo    ��ȣ : �� ���μ����� �� ���� ��� �ʿ��� �ּ��� �������� �����Ǿ� ����.
echo    ��� : �� ���μ����� ������ ������ �ο��� �������� �����ǰ� ����.
echo    ��� : nobody ������, �ٸ� �������� ���Ǵ� ��� ���� Ȯ���� �ʿ���.
echo.
echo.

echo �� ���� ���
if exist "C:\inetpub\" (
	net user | findstr /C:"nobody" > nul
	if errorlevel 1 (
		echo    �� ��� ^(nobody ������ �������� ����^)
		goto WARN
	) else (
		icacls "C:\inetpub" | findstr /C:"nobody"
		if errorlevel 1 (
			echo    �� ��� ^(�� ���μ����� nobody �������� �����ǰ� ���� ����^)
			goto WARN
		) else (
			echo    �� ��ȣ ^(�� ���� ��� �ʿ��� �ּ��� �������� �����Ǿ� ����^)
			goto SAFE
		)
	)
) else (
	echo    �� ��ȣ ^(�� ���� ���丮�� �������� ����^)
	goto SAFE
)

:WARN
	echo.
	echo.
	echo �� ��ġ ���
	echo    1. ���� -^> ������ -^> �������� -^> ��ǻ�� ���� -^> ���� ����� �� �׷� -^> ����� ���� -^> nobody ���� �߰� 
	echo    2. ���� -^> ������ -^> �������� -^> ���� ���� ��å -^> ����� ���� �Ҵ� ����, " ���� �α׿�" �� "nobody" ���� �߰�
	echo    3. ���� -^> ���� -^> SERVICES.MSC -^> IIS Admin Service -^> �Ӽ� -^> [�α׿�] ���� ���� ������ nobody ���� �� �н�����
	echo    4. ���� -^> ���α׷� -^> ������ Ž���� -^> IIS�� ��ġ�� ���� �Ӽ� -^> [����] �ǿ��� nobody ������ �߰��ϰ� ��� ���� üũ
	call %CHK_FILE% WARN %1
	goto CONTINUE

:SAFE
    call %CHK_FILE% SAFE %1

:CONTINUE
	echo.
	echo.
