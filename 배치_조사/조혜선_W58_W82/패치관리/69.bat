@echo off

echo. W-69 정책에 따른 시스템 로깅 설정
echo.
echo [ W-69 "정책에 따른 시스템 로깅 설정" ]
echo.
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditLogonEvents"
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditPrivilegeUse"
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditPolicyChange"
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditAccountManage"
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditDSAccess"
type [RESULT]_%COMPUTERNAME%_Local_Security_Policy.txt | Find /I "AuditAccountLogon"
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step Step 1 시작> 실행> SECPOL.MSC> 로컬 정책> 감사 정책
    echo 로그온 이벤트, 계정 로그온 이벤트, 정책 변경 : 성공/실패 감사
    echo 계정 관리, 디렉토리 서비스 액세스, 권한 사용 : 실패 감사
)