@echo off
echo ###################################################################################
echo [W10] ���� ���� - IIS���� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ :  IIS ���񽺸� ������� ����.
echo 	��� :  IIS ���񽺸� ����ϴ� ���, �ʿ����� Ȯ�� ���.
echo.
echo.

echo �� ���� ���
sc query "W3SVC" | find /I "RUNNING"
if errorlevel 1 (
    echo    �� ��ȣ ^(IIS ���񽺸� ������� ����^)
    call %CHK_FILE% SAFE %1
) else (
    echo    �� ��� ^(IIS ���񽺸� �����, �ʿ����� Ȯ�� ���^)
    echo.
    echo.
    echo �� ��ġ ���
    echo    Step1^) IISADMIN ���� ���� : ���� -^> ���� -^> SERVICES.MSC -^> IISADMIN -^> �Ӽ� -^> "���� ����"�� "��� �� ��" ���� �� ����
    echo    Step2^) IISADMIN ���� ������ : ���������� -^> ���� -^> ���� �� ��� ���� -^> ���� ���� -^> �� ����^(UUS^), ���� �� ����
    call %CHK_FILE% WARN %1
)
echo.
echo.