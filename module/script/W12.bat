@echo off
echo ###################################################################################
echo [W12] ���񽺰��� - IIS CGI ���� ����
echo.

echo �� ���� ����
echo    ��ȣ : �⺻ CGI ���丮�� Everyone�� ��� ����, ����, ���� ���� ������.
echo    ��� : �⺻ CGI ���丮�� Everyone�� ��� ����, ����, ���� ���� ����.
echo.
echo.

echo �� ���� ���
set "filePath=%IIS_PATH%"

if exist "%filePath%" (
	icacls %filePath% | findstr /C:"Everyone"
	if errorlevel 1 (
    	echo    �� ��ȣ ^(�⺻ CGI ���丮�� Everyone �׷��� �������� ����^)
		goto SAFE
	) else (
		icacls %filePath% | findstr /C:"Everyone" | findstr /C:"F)" >nul
		rem Everyone �׷쿡 ��� ������ �ִ��� Ȯ��
		if errorlevel 1 (
			icacls %filePath% | findstr /C:"Everyone" | findstr /C:"M)" >nul
			rem Everyone �׷쿡 ���� ������ �ִ��� Ȯ��
			if errorlevel 1 (
				icacls %filePath% | findstr /C:"Everyone" | findstr /C:"W)" >nul
				rem Everyone �׷쿡 ���� ������ �ִ��� Ȯ��
				if errorlevel 1 (
					echo    �� ��ȣ ^(�⺻ CGI ���丮�� Everyone �׷� ������ ��ȣ��^)
					goto SAFE
				) else (
					echo    �� ��� ^(�⺻ CGI ���丮 Everyone �׷쿡 ���� ������ ������^)
					goto PWN
				)
			) else (
				echo    �� ��� ^(�⺻ CGI ���丮 Everyone �׷쿡 ���� ������ ������^)
				goto PWN
			)
		) else (
			echo    �� ��� ^(�⺻ CGI ���丮 Everyone �׷쿡 ��� ������ ������^)
			goto PWN
		)
	)
) else (
	echo    �� ��ȣ ^(�⺻ CGI ���丮�� �������� ����^)
	goto SAFE
)

:PWN
    echo.
    echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� Ž���� -^> �ش� ���丮 -^> �Ӽ� -^> ����
	echo 	Step2^) Everyone�� ��� ����, ���� ����, ���� ���� ����
	call %CHK_FILE% PWN %1
	goto CONTINUE

:SAFE
    call %CHK_FILE% SAFE %1

:CONTINUE
	echo.
	echo.