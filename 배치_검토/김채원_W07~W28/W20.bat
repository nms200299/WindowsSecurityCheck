@echo off
echo ###################################################################################
echo [W20] ���� ���� - IIS ������ ���� ACL ����
echo.

echo �� ���� ����
echo 	��ȣ :  Ȩ ���丮 ���� �ִ� ���� ���ϵ鿡 ���� Everyone ������ �������� ����
echo 	��� :  Ȩ ���丮 ���� �ִ� ���� ���ϵ鿡 ���� Everyone ������ ����
echo.
echo.

icacls "C:\inetpub\wwwroot"

icacls "C:\inetpub\wwwroot" | findstr /I "Everyone" > NUL

echo �� ���� ���
if %errorlevel% EQU 0 (
  echo B^|[W-20] Ȩ ���丮 ���� �ִ� ���� ���ϵ鿡 ���� Everyone ������ ���� - [���]
  echo.
echo �� ��ġ ���
  echo ����-����-INETMGR �Է�-����Ʈ Ŭ��-�ش� ������Ʈ-�⺻ ����- Ȩ ���丮 ���� ��� Ȯ�� 
  echo Ž���⸦ �̿��Ͽ� Ȩ ���丮�� ��� ����-[����]�ǿ��� Everyone ���� Ȯ�� 
  echo ���ʿ��� Everyone ������ �����Ͻʽÿ�.
)	else (
	echo B^|[W-20] Ȩ ���丮 ���� �ִ� ���� ���ϵ鿡 ���� Everyone ������ �������� ���� - [��ȣ]
)
echo.
echo.
pause