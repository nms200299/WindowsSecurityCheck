@echo off
echo ###################################################################################
echo [W07] ���� ���� - ���� ���� �� ����� �׷� ����
echo.

echo �� ���� ����
echo 	��ȣ : �Ϲ� ���� ���丮�� ���ų� ���� ���丮 ���� ���ѿ� Everyone ������ ����.
echo 	��� : �Ϲ� ���� ���丮�� ���� ���ѿ� Everyone ������ ����.
echo.
echo.

set /a "flag=0"
echo �� ���� ���
for /f "tokens=1" %%a in ('net share') do (
	if NOT "%%a" == "-------------------------------------------------------------------------------" (
		if NOT "%%a" == "����" (
			if NOT "%%a" == "C$" (
				if NOT "%%a" == "D$" (
					if NOT "%%a" == "IPC$" (
						if NOT "%%a" == "ADMIN$" (
							if NOT "%%a" == "�����" (
								set "shareDir=%%a"
								net share %%a
								net share %%a | findstr /I /C:"Everyone"
								if NOT errorlevel 1 (
									set /a "flag=1"
									echo ���� ���͸� : !shareDir!
								)
							) else (
								goto break
							)
						)
					)
				)
			)
		)
	)
)
:break
if %flag% EQU 1 (
	echo 	�� ��� ^(���� ���丮�� Everyone ������ �����Ǿ� ����^)
	echo.
	echo.
	echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> FSMGMT.MSC -^> ����
	echo 	Step2^) ��� ���ѿ��� Everyone ���� �� ������ �����ϰ� ������ �ʿ��� ������ ������ ���� �߰�
	call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^(���� ���丮�� Everyone ������ �����Ǿ� ���� ����^)
	call %CHK_FILE% SAFE %1
)
