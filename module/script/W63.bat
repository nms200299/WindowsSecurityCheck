@echo off
echo ###################################################################################
echo [W63] ���� ���� - DNS ���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ : DNS ���񽺸� ������� �ʰų� ���� ������Ʈ ������ �Ǵ� �ƴϿ������� �����Ǿ� ����.
echo 	��� : ���񽺸� ����ϸ� ���� ������Ʈ�� �����Ǿ� ����.
echo.
echo.

echo �� ���� ���
set flag=0
net start | findstr /I /C:"DNS Server"
if errorlevel 1 (
	echo 	�� ��ȣ ^(DNS ���񽺸� ������� ����^)
) else (
	for /F "delims=" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones"') do (
		echo %%a | findstr /C:"TrustAnchors" >nul
		if errorlevel 1 (
			echo %%a
			reg query "%%a" | findstr /C:"AllowUpdate    REG_DWORD    0x1"
			if not errorlevel 1 (
				echo 	�� ��� ^(���� ������Ʈ�� ������^)
				set flag=1
			) else (
				echo 	�� ��ȣ ^(���� ������Ʈ�� �������� ����^)
			)
		)
	)
)


if !flag! EQU 1 (
	echo.
	echo    �ϳ��� Zone�̶� ����ϸ� ������� ����.
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> DNSMGMT.MSC -^> �� ��ȸ ���� -^> �ش� ���� -^> �Ӽ� -^> �Ϲ�
	echo 	Step2^) ���� ������Ʈ �� ���� �Ǵ�, �ƴϿ� ����
    echo    Step3^) ���� -^> ���� -^> SERVICES.MSC -^> DNS ���� -^> �Ӽ� '�Ϲ�' �ǿ��� "���� ����"�� "��� �� ��"���� ������ ��, DNS ���� ����
	call %CHK_FILE% PWN %1
) else (
	call %CHK_FILE% SAFE %1
)

echo.
echo.

