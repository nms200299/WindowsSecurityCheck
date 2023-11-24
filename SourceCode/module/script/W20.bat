@echo off
echo ###################################################################################
echo [W20] ���� ���� - IIS ������ ���� ACL ����
echo.

echo �� ���� ����
echo 	��ȣ :  Ȩ ���丮 ���� �ִ� ���� ���ϵ鿡 ���� Everyone ������ �������� ����
echo 	��� :  Ȩ ���丮 ���� �ִ� ���� ���ϵ鿡 ���� Everyone ������ ����
echo.
echo.

echo �� ���� ���
set "filePath=C:\inetpub\wwwroot"
set "option=0"
set "flag=0"

For /F "delims=" %%a IN ('icacls %filePath% /T') DO (
    echo %%a | findstr /C:"%filePath%" >nul
    if not errorlevel 1 (
      rem �࿡ ���� ��ΰ� �ִٸ� ���ο� ������ ������ üũ
      set "option=0"
      rem �⺻������ option 0���� ����
      echo %%a | findstr /R "\.exe\>" >nul
      if errorlevel 1 (echo %%a | findstr /R "\.dll\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.cmd\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.pl\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.asp\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.inc\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.shtm\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.shtml\>" >nul)
      if not errorlevel 1 (
        rem everyone ������ ���־� �ϴ� ������ option 1�� ����
        set "option=1"
      ) else (
        if errorlevel 1 (echo %%a | findstr /R "\.txt\>" >nul)
        if errorlevel 1 (echo %%a | findstr /R "\.gif\>" >nul)
        if errorlevel 1 (echo %%a | findstr /R "\.jpg\>" >nul)
        if errorlevel 1 (echo %%a | findstr /R "\.html\>" >nul)
        if not errorlevel 1 (
          rem everyone ������ r�� ���Ǵ� ������ option 2�� ����
          set "option=2"
        )
      )
    )

    if !option! EQU 1 (
      rem option�� 1�̸�, everyone �׷� ����� ���
      echo %%a | findstr /R "\<Everyone:"
      if not errorlevel 1 (
        set "flag=1"
      )

    ) else if !option! EQU 2 (
      rem option�� 2��, everyone �׷쿡�� R ���� �̿� ����� ���
      echo %%a | findstr /R "\<Everyone:" >nul
      if not errorlevel 1 (
        echo %%a | findstr /R "\<Everyone:(R)" >nul
        if errorlevel 1 (
          echo %%a
          set "flag=1"
        )
      )
    )
)

if !flag! EQU 1 (
  echo    �� ��� ^(����� ������ ������ �߰ߵ�^)
  echo.
  echo.
  echo �� ��ġ ���
  echo    step 1^) ���� -^> ���� -^> INETMGR �Է� -^> ����Ʈ Ŭ�� -^> �ش� ������Ʈ -^> �⺻ ���� -^> Ȩ ���丮 ���� ��� Ȯ�� 
  echo    step 2^) Ž���⸦ �̿��Ͽ� Ȩ ���丮�� ��� ���� -^> [����]�ǿ��� Everyone ���� Ȯ��
  echo    step 3^) �Ʒ��� ���� ���ϵ鿡 ���� ���ʿ��� Everyone ������ �����Ͻʽÿ�.
  echo                CGI^(.exe, .dll. cmd. .pl^) : ��� ���^(X^), ������/�ý���^(��ü ����^)
  echo                ��ũ��Ʈ ����^(.asp^) : ��� ���^(X^), ������/�ý���^(��ü ����^)
  call %CHK_FILE% PWN %1
) else (
  echo    �� ��ȣ ^(����� ������ ������ �߰ߵ��� ����^)
  call %CHK_FILE% SAFE %1
)
echo.
echo.




