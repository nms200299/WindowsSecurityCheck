@echo off
echo ###################################################################################
echo [W79] ���� ���� - ���� �� ���͸� ��ȣ
echo.

echo �� ���� ����
echo 	��ȣ : NTFS ���� �ý����� �����.
echo 	��� : FAT���� �ý����� �����.
echo.
echo.

echo �� ���� ���
fsutil fsinfo volumeinfo c:| find /I "�ý���" | find /i "FAT"
if %errorlevel% EQU 0 (
	echo 	�� ��ȣ ^(NTFS ���� �ý����� �����.^)
    call %CHK_FILE% SAFE %1
) else (
	echo 	�� ��� ^(FAT���� �ý����� �����.^)
    echo �� ��ġ ���
	echo 	Step1^) ��ɾ� ������Ʈ[DOSâ]���� ������ ���� �Է� ����> ����> CMD> convert ����̺��: /fs:ntfs
	echo    ��: convert F: /fs/ntfs��� �Է��ϸ� F ����̺�� NTFS �������� ���˵�
    call %CHK_FILE% PWN %1
)
echo.
echo.