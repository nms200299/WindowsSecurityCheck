@echo off
echo ###################################################################################
echo [W40] ���� ���� - ���� �ý��ۿ��� ������ �ý��� ����
echo.

echo �� ���� ����
echo 	��ȣ :  ������ �ý��ۿ��� ������ �ý��� ���ᡱ ��å�� ��Administrators���� �����ϴ� ���
echo 	��� :  : ������ �ý��ۿ��� ������ �ý��� ���ᡱ ��å�� ��Administrators�� �� �ٸ� ���� �� �׷��� �����ϴ� ���
echo.          
echo.

echo �� ���� ���

find /i "SeRemoteShutdownPrivilege" ../tmp/securityPolicy.txt | find /v "---------- ../TMP/SECURITYPOLICY.TXT"
echo 	�� ���� ^(�Ǵ� �Ұ�^)
echo.
echo.

echo �� ��ġ ���
echo 	Step1^) ���� -^> ���� -^> SECPOL.MSC -^> ���� ��å -^> ����� ���� �Ҵ�
echo 	Step2^) ������ �ý��ۿ��� ������ �ý��� ���ᡱ ��å�� Administrators �� �ٸ� ���� �� �׷� ����
call %CHK_FILE% WARN %1
echo.
echo.
