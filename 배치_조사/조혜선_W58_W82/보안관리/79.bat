@echo off

echo. W-79 ���� �� ���͸� ��ȣ
echo.
echo [ W-79 "���� �� ���͸� ��ȣ" ]
echo.
fsutil fsinfo volumeinfo c:| find /I "�ý���" | find /i "FAT"
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 : ��ɾ� ������Ʈ[DOSâ]���� ������ ���� �Է� ����> ����> CMD> convert ����̺��: /fs:ntfs
    echo ��: convert F: /fs/ntfs��� �Է��ϸ� F ����̺�� NTFS �������� ���˵�
)