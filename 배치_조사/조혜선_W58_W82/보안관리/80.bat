@echo off
echo W-80 ��ǻ�� ���� ��ȣ �ִ� ��� �Ⱓ
echo.
echo [ W-80 "��ǻ�� ���� ��ȣ �ִ� ��� �Ⱓ" ]
echo.
secedit /EXPORT /CFG log.txt > nul
type log.txt | findstr /i "MaximumPasswordAge=" >> MaxPwAge.txt
for /f "delims=',' tokens=2" %%a in (MaxPwAge.txt) do set MaxPwAge=%%a
type log.txt | findstr /i "DisablePasswordChange"  | find "4,1" > nul
if errorlevel 1 (
    if %MaxPwAge% leq 90 (
        echo �� ���: ��ȣ
    ) else (
        echo �� ���: ���
        echo "������ ������: ��ǻ�� ���� ��ȣ ���� ���� ��� �� ��" ��å�� "��� �� ��"�� ������
        echo "������ ������: ��ǻ�� ���� ��ȣ�� �ִ� ��� �Ⱓ"�� "90��" �ʰ��̴�.
        echo �� ��ġ ���
        echo Step 1 : ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
        echo Step 2 : "������ ������: ��ǻ�� ���� ��ȣ�� �ִ� ��� �Ⱓ" �� 90��
    )
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 : ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
    echo Step 2 : "������ ������: ��ǻ�� ���� ��ȣ ���� ���� ��� �� ��" �� ��� �� ��, "������ ������: ��ǻ�� ���� ��ȣ�� �ִ� ��� �Ⱓ" �� 90��
)
del log.txt
del MaxPwAge.txt