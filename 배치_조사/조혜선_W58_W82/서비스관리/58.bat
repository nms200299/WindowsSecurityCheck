@echo off

echo. W-58 터미널 서비스 암호화 수준 설정
echo.
echo [ W-58 "터미널 서비스 암호화 수준 설정" ]
echo.
net start | find /I "Remote Desktop Services"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" | find /I "MinEncryptionLevel"
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 시작> 실행 - GPEDIT.MSC : 로컬 그룹 정책 편집기
    echo Step 2 컴퓨터 구성- 관리 템플릿- Windows 구성 요소> 터미널 서비스> 원격 데스크톱 세션 호스트 > 보안
    echo Step 3 "클라이언트 연결 암호화 수준 설정" - "암호화 수준"을 클라이언트 호환 가능으로 설정
)