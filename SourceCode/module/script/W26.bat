echo ###################################################################################
echo [W25] 서비스 관리 - FTP 디렉토리 접근권한 설정
echo.

echo ■ 진단 기준
echo 	양호 :  FTP 홈 디렉토리에 Everyone 권한이 없음.
echo 	취약 :  FTP 홈 디렉토리에 Everyone 권한이 있음.
echo.
echo.

echo ■ 진단 결과
set "filePath=%FTP_PATH%"
set "flag=0"


icacls %filePath% | findstr /i "Everyone"
if not errorlevel 1 (
    set "flag=1"
)
rem FTP 홈 디렉터리의 OS ACL 정책에 Everyone 권한이 있는 경우

type C:\Windows\System32\inetsrv\config\applicationHost.config | findstr /I /C:"<add accessType=\"Allow\" users=\"*\""
if not errorlevel 1 (
    set "flag=1"
)
rem FTP 정책에 모든 사용자 허용 설정이 있는 경우


if !flag! EQU 0 (
    echo    → 양호 ^(FTP 홈 디렉토리에 Everyone 권한이 없음^)
    call %CHK_FILE% SAFE %1
) else (
    echo    → 취약 ^(FTP 홈 디렉토리에 Everyone 권한이 있음^)
    echo.
    echo.
    echo ■ 조치 방안
    echo    Step 1^) 제어판 -^> 관리도구 -^> 인터넷 정보 서비스 ^(IIS^) 관리 -^> 해당 웹 사이트 -^> 마우스 우클릭 -^> FTP 게시 추가
    echo    Step 2^) 이후 진행 과정에서 권한 부여 화면의 엑세스 허용 대상 선정시 ^[지정한 사용자^]만 선택
    echo    Step 3^) FTP 홈 디렉토리에 Everyone 권한 삭제
    call %CHK_FILE% PWN %1
)
echo.
echo.