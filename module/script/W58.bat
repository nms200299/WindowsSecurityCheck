@echo off
echo ###################################################################################
echo [W58] ���� ���� - �͹̳� ���� ��ȣȭ ���� ����
echo.

echo �� ���� ����
echo    ��ȣ :  �͹̳� ���񽺸� ������� �ʰų� ��� �� ��ȣȭ ������ "Ŭ���̾�Ʈ�� ȣȯ ����^(�߰�^)" �̻����� ������ ���
echo    ��� :  �͹̳� ���񽺸� ����ϰ� ��ȣȭ ������ "����"���� ������ ���
echo.
echo.

echo �� ���� �����
net start | find /I "Remote Desktop Services"
if errorlevel 1 (
    echo    �� ��ȣ ^(�͹̳� ���񽺸� ������� �ʽ��ϴ�^)
    goto SAFE
) else (
    reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MinEncryptionLevel"
    if errorlevel 1 (
        echo    �� ��� ^(��ȣȭ ������ '�������� ����' �Ǵ� '��� �� ��'���� �����Ǿ� ����^)
        goto PWN
    ) else (
        reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MinEncryptionLevel" | findstr /C:"0x1" >NUL
        if errorlevel 1 (
            echo    �� ��ȣ ^(��ȣȭ ������ 'Ŭ���̾�Ʈ ȣȯ ����' �̻����� �����Ǿ� ����^)
            goto SAFE
        ) else (
            echo    �� ��� ^(��ȣȭ ������ '���� ����'���� �����Ǿ� ����^)
            goto PWN
        )

    )

)


:PWN
echo.
echo.
echo �� ��ġ ���
echo    step 1^) ���� -^> ���� - GPEDIT.MSC : ���� �׷� ��å ������
echo    step 2^) ��ǻ�� ����- ���� ���ø�- Windows ���� ��� -^> �͹̳� ���� -^> ���� ����ũ�� ���� ȣ��Ʈ -^> ����
echo    step 3^) "Ŭ���̾�Ʈ ���� ��ȣȭ ���� ����" -^> "��ȣȭ ����"�� Ŭ���̾�Ʈ ȣȯ �������� ����
call %CHK_FILE% PWN %1
goto CONTINUE

:SAFE
call %CHK_FILE% SAFE %1

:CONTINUE
echo.
echo.
