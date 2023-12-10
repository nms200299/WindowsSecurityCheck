@echo off
echo ###################################################################################
echo [W16] ���� ���� - IIS ��ũ ������
echo.

echo �� ���� ����
echo    ��ȣ : �ɺ��� ��ũ, aliases, �ٷΰ��� ���� ������� ����.
echo    ��� : �ɺ��� ��ũ, aliases, �ٷΰ��� ���� �����.
echo.
echo.

echo �� ���� �����
set dirPath=%IIS_PATH%

if exist %dirPath% (
    set flag=0

    for /r "%dirPath%" %%G in (*.lnk *.url) do (
        echo %%G
        set flag=1
    )
    rem dir�� �Ľ��ϸ� ���ϸ��� �������� �Ľ��� �� �ֱ⿡
    rem Ȯ���ڸ� �������� �ϱ� ���� �� ��� ä��

    dir %dirPath% | find "<SYMLINK"
    if not errorlevel 1 (
        set flag=1
    )
    rem ������ <SYMLINK>��, ������ <SYMLINKD>�� ǥ�õȴ�

    dir "%dirPath%" | find "<JUNCTION>"
    if not errorlevel 1 (
        set flag=1
    )

    if !flag! EQU 1 (
        echo    �� ��� ^(�ɺ��� ��ũ, aliases, �ٷΰ��� ���� �����^)
        echo.
        echo.
        echo �� ��ġ ���
        echo    Step1^) ������ -^> �ý��� �� ���� -^> �������� -^> IIS������ -^>
        echo            �ش� ������Ʈ -^> �⺻ ���� -^> "���� ���"���� Ȩ ���丮 ��ġ Ȯ��
        echo    Step2^) ���� ��ο� �Էµ� Ȩ ���丮�� �̵��Ͽ� �ٷΰ��� ������ ����
        call %CHK_FILE% PWN %1
    ) else (
        echo    �� ��ȣ ^(�ɺ��� ��ũ, aliases, �ٷΰ��� ���� ������� ����^)
        call %CHK_FILE% SAFE %1
    )
) else (
    echo    �� ��ȣ ^(IIS �� ���񽺸� ������� ����^)
    call %CHK_FILE% SAFE %1
)

echo.
echo.
