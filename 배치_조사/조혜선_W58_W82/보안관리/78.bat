@echo off
echo. W-78 ���� ä�� ������ ������ ��ȣȭ �Ǵ� ����
echo.
echo [ W-78 "���� ä�� ������ ������ ��ȣȭ �Ǵ� ����" ]
echo.
secedit /EXPORT /CFG log.txt > nul
type log.txt | find /i "RequireSignOrSeal" | find "4,0" > nul
if errorlevel 1 (
    type log.txt | find /i "SealSecureChannel" | find "4,0"
    if errorlevel 1 (
        type log.txt | find /i "SignSecureChannel" | find "4,0"
        if errorlevel 1 (
            echo �� ���: ��ȣ
        ) else (
            echo �� ���: ���
            echo �� ��ġ ���
            echo Step 1 : ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
            echo Step 2 : �Ʒ� 3���� ��å�� ��� "���" ���� ����
            echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ �Ǵ� ���� [�׻�]
            echo - ������ ������: ���� ä�� ������ ������ ���� [������ ���]
            echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ [������ ���]
        )
    ) else (
        echo �� ���: ���
        echo �� ��ġ ���
        echo Step 1 : ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
        echo Step 2 : �Ʒ� 3���� ��å�� ��� "���" ���� ����
        echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ �Ǵ� ���� [�׻�]
        echo - ������ ������: ���� ä�� ������ ������ ���� [������ ���]
        echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ [������ ���]
    )
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 : ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
    echo Step 2 : �Ʒ� 3���� ��å�� ��� "���" ���� ����
    echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ �Ǵ� ���� [�׻�]
    echo - ������ ������: ���� ä�� ������ ������ ���� [������ ���]
    echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ [������ ���]
)
del log.txt