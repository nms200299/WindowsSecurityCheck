@echo off 

echo. W-77 LAN Manager ���� ����
echo.
echo [ W-77 "LAN Manager ���� ����" ]
echo.
secedit /EXPORT /CFG log.txt > nul
type log.txt | findstr /i "LmCompatibilityLevel"  | find "4,3" > nul
echo.
if not errorlevel 1 (
    echo �� ���: ��ȣ
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 ���� - ���� - SECPOL.MSC - ���� ��å - ���� �ɼ�
    echo Step 2 ����Ʈ��ũ ����: LAN Manager ���� ���ء� ��å�� NTLMv2 ���丸 �����⡱ ����
)
del log.txt