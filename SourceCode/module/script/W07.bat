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
								for /f "tokens=1-4" %%a in ('net share %shareDir%') do (
									if "%%a" == "���" (
										if /i "%%c" == "Everyone," (
											if NOT "%%d" == "����" (
												set /a "flag=1"
												echo %shareDir%	: Everyone ����
											)
										)

									)
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
	call %CHK_FILE% WARN %1
) else (
	echo 	�� ��ȣ ^(���� ���丮�� Everyone ������ �����Ǿ� ���� ����^)
	call %CHK_FILE% SAFE %1
)
