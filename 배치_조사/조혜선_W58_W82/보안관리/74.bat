@echo off
echo. W-74 ���� ������ �ߴ��ϱ� ���� �ʿ��� ���޽ð�
echo.
echo [ W-74 "���� ������ �ߴ��ϱ� ���� �ʿ��� ���޽ð�" ]
echo.
secedit /EXPORT /CFG log.txt > nul
net config server /n | find "����" >> idle.txt
for /f "tokens=5" %%a in (idle.txt) do set idle=%%a
type log.txt | findstr /i "EnableForcedLogOff"  | find "4,0" > nul
if errorlevel 1 (
    if %idle% geq 15 (
        echo �� ���: ��ȣ
    ) else (
        echo �� ���: ���
        echo "�α׿� �ð��� ����Ǹ� Ŭ���̾�Ʈ ���� ����" ��å�� "���"�� ������
        echo "���� ������ �ߴ��ϱ� ���� �ʿ��� ���� �ð�"�� "15��" �̸��̴�.
        echo �� ��ġ ���
        echo Step 1 : ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
        echo Step 2 : "Microsoft ��Ʈ��ũ ����: ���� ������ �ߴ��ϱ� ���� �ʿ��� ���� �ð�" ��å "15��" ����
    )
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 : ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
    echo Step 2 : "Microsoft ��Ʈ��ũ ����: �α׿� �ð��� ����Ǹ� Ŭ���̾�Ʈ ���� ����" ��å "���" ����
)
del log.txt
del idle.txt