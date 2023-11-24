@echo off
echo ###################################################################################
echo [W20] 서비스 관리 - IIS 데이터 파일 ACL 적용
echo.

echo ■ 진단 기준
echo 	양호 :  홈 디렉토리 내에 있는 하위 파일들에 대해 Everyone 권한이 존재하지 않음
echo 	취약 :  홈 디렉토리 내에 있는 하위 파일들에 대해 Everyone 권한이 존재
echo.
echo.

echo ■ 진단 결과
set "filePath=C:\inetpub\wwwroot"
set "option=0"
set "flag=0"

For /F "delims=" %%a IN ('icacls %filePath% /T') DO (
    echo %%a | findstr /C:"%filePath%" >nul
    if not errorlevel 1 (
      rem 행에 파일 경로가 있다면 새로운 파일의 권한을 체크
      set "option=0"
      rem 기본적으로 option 0으로 설정
      echo %%a | findstr /R "\.exe\>" >nul
      if errorlevel 1 (echo %%a | findstr /R "\.dll\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.cmd\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.pl\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.asp\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.inc\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.shtm\>" >nul)
      if errorlevel 1 (echo %%a | findstr /R "\.shtml\>" >nul)
      if not errorlevel 1 (
        rem everyone 권한을 없애야 하는 파일은 option 1로 설정
        set "option=1"
      ) else (
        if errorlevel 1 (echo %%a | findstr /R "\.txt\>" >nul)
        if errorlevel 1 (echo %%a | findstr /R "\.gif\>" >nul)
        if errorlevel 1 (echo %%a | findstr /R "\.jpg\>" >nul)
        if errorlevel 1 (echo %%a | findstr /R "\.html\>" >nul)
        if not errorlevel 1 (
          rem everyone 권한이 r이 허용되는 파일은 option 2로 설정
          set "option=2"
        )
      )
    )

    if !option! EQU 1 (
      rem option이 1이면, everyone 그룹 존재시 취약
      echo %%a | findstr /R "\<Everyone:"
      if not errorlevel 1 (
        set "flag=1"
      )

    ) else if !option! EQU 2 (
      rem option이 2면, everyone 그룹에서 R 권한 이외 존재시 취약
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
  echo    → 취약 ^(취약한 권한의 파일이 발견됨^)
  echo.
  echo.
  echo ■ 조치 방안
  echo    step 1^) 시작 -^> 실행 -^> INETMGR 입력 -^> 사이트 클릭 -^> 해당 웹사이트 -^> 기본 설정 -^> 홈 디렉토리 실제 경로 확인 
  echo    step 2^) 탐색기를 이용하여 홈 디렉토리의 등록 정보 -^> [보안]탭에서 Everyone 권한 확인
  echo    step 3^) 아래와 같은 파일들에 대한 불필요한 Everyone 권한을 제거하십시오.
  echo                CGI^(.exe, .dll. cmd. .pl^) : 모든 사람^(X^), 관리자/시스템^(전체 제어^)
  echo                스크립트 파일^(.asp^) : 모든 사람^(X^), 관리자/시스템^(전체 제어^)
  call %CHK_FILE% PWN %1
) else (
  echo    → 양호 ^(취약한 권한의 파일이 발견되지 않음^)
  call %CHK_FILE% SAFE %1
)
echo.
echo.




