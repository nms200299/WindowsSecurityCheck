@echo off

echo. W-73 ����ڰ� ������ ����̹��� ��ġ�� �� ���� ��
echo.
echo [ W-73 "����ڰ� ������ ����̹��� ��ġ�� �� ���� ��" ]
echo.
secedit /EXPORT /CFG log.txt > nul
type log.txt | findstr /i "AddPrinterDrivers" | find "4,1" > nul
echo.
if not errorlevel 1 (
    echo �� ���: ��ȣ
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 : ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
    echo Step 2 : ����ġ: ����ڰ� ������ ����̹��� ��ġ�� �� ���� �ԡ� ��å�� ����롱 ���� ����
)
del log.txt