@echo off

echo. W-82 Windows 인증 모드 사용
echo.
echo [ W-82 "Windows 인증 모드 사용" ]
echo.
echo  ■ MS-SQL 서비스 확인 ■                                          						       
net start | find /I "SQL Server"																
echo.                                                                                           
echo.                                                                                           
echo  ■ MS-SQL 인증 모드 확인 ■                                          						    
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server" mssqlreg_%COMPUTERNAME%_WINSVR.dmp
TYPE mssqlreg_%COMPUTERNAME%.dmp | findstr "LoginMode"											
echo.                                                                                           
reg query "HKLM\Software\Microsoft\Microsoft SQL Server" /s | findstr /i "LoginMode"
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 SQL Server Management Studio - 해당 서버 우클릭 - 속성 - 보안 - 서버 인증 - Windows 인증 모드'W'를 클릭하여 활성화
)