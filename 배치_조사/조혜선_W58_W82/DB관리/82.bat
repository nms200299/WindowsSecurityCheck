@echo off

echo. W-82 Windows ���� ��� ���
echo.
echo [ W-82 "Windows ���� ��� ���" ]
echo.
echo  �� MS-SQL ���� Ȯ�� ��                                          						       
net start | find /I "SQL Server"																
echo.                                                                                           
echo.                                                                                           
echo  �� MS-SQL ���� ��� Ȯ�� ��                                          						    
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server" mssqlreg_%COMPUTERNAME%_WINSVR.dmp
TYPE mssqlreg_%COMPUTERNAME%.dmp | findstr "LoginMode"											
echo.                                                                                           
reg query "HKLM\Software\Microsoft\Microsoft SQL Server" /s | findstr /i "LoginMode"
echo.
if errorlevel 1 (
    echo �� ���: ��ȣ
    
) else (
    echo �� ���: ���
    echo �� ��ġ ���
    echo Step 1 SQL Server Management Studio - �ش� ���� ��Ŭ�� - �Ӽ� - ���� - ���� ���� - Windows ���� ���'W'�� Ŭ���Ͽ� Ȱ��ȭ
)