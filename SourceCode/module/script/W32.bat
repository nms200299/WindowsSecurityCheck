@echo off
echo ###################################################################################
echo [W32] �ֽ� HOT FIX ����
echo.

echo �� ���� ����
echo 	��ȣ :  �ֽ� Hotfix�� �ִ��� �ֱ������� ����͸��ϰ� �ݿ��ϰų�, PMS (Patch Management System) Agent�� ��ġ�Ǿ� �ڵ���ġ������ ����� ���
echo 	��� :  �ֽ� Hotfix�� �ִ��� �ֱ������� ����� ������ ���ų�, �ֽ� Hotfix�� �ݿ����� ���� ���, ���� PMS(Patch Management System) Agent�� ��ġ�Ǿ� ���� �ʰų�, ��ġ�Ǿ� ������ �ڵ���ġ������ ������� ���� ���
echo    ���� :  ���α׷��� ���� �Ǵ� �� �� ����
echo.
echo.

echo �� ���� �����
echo 	�� ���� ^(�Ǵ� �Ұ�^)
echo.
echo.
echo �� ��ġ ���
echo 	- ���� HOT FIX ���� -
echo 	�Ʒ��� ����Ʈ���� ��ġ ����Ʈ�� ��ȸ�Ͽ�, ������ �ʿ��� ��ġ�� �����Ͽ� �������� ��ġ��
echo	 https://technet.microsoft.com/ko-kr/security/
echo.
echo 	- �ڵ� HOT FIX ���� -
echo 	������ -^> windows update
echo.
echo 	- PMS -
echo 	Agent�� ��ġ�Ͽ� �ڵ����� ������Ʈ �ǵ��� ����
call %CHK_FILE% WARN %1
echo.
echo.

