@echo off

echo. W-70 이벤트 로그 관리 설정
echo.
echo [ W-70 "이벤트 로그 관리 설정" ]
echo.
echo. # 응용프로그램 확인 #                                                                          
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application" | find /I "MaxSize"     
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application" | find /I "Retention"   
echo. # 시스템 확인 #                                                                               
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\System" | find /I "MaxSize"          
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\System" | find /I "Retention"       
echo. # 보안 확인 #                                                                               
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security" | find /I "MaxSize"        
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security" | find /I "Retention" 
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 시작 - 실행 - EVENTVWR.MSC - 해당 로그 - 속성 - 일반
    echo Step 2 최대 로그 크기 → 10240KB
)