@echo off
echo ###################################################################################
echo [W77] ���� ���� - LAN Manager ���� ����
echo.

echo �� ���� ����
echo 	��ȣ : "LAN Manager ���� ����" ��å�� "NTLMv2 ���丸 ����"�� �����Ǿ� ����.
echo 	��� : "LAN Manager ���� ����" ��å�� "LM" �� "NTLM"������ �����Ǿ� ����.
echo.
echo.

echo �� ���� ���
secedit /EXPORT /CFG log.txt > nul
type log.txt | findstr /i "LmCompatibilityLevel"  | find "4,3" > nul
if %errorlevel% EQU 0 (
	echo 	�� ��� ^("LAN Manager ���� ����" ��å�� "LM" �� "NTLM"������ �����Ǿ� ����.^)
    echo �� ��ġ ���
	echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ���� �ɼ�
	echo    Step2^) ����Ʈ��ũ ����: LAN Manager ���� ���ء� ��å�� NTLMv2 ���丸 �����⡱ ����
    call %CHK_FILE% PWN %1
) else (
	echo 	�� ��ȣ ^("LAN Manager ���� ����" ��å�� "NTLMv2 ���丸 ����"�� �����Ǿ� ����.^)
    call %CHK_FILE% SAFE %1
)
echo.
echo.