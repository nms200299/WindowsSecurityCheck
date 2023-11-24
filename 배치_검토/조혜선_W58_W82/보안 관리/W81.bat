@echo off

echo. W-81 시작프로그램 목록 분석
echo.
echo [ W-81 "시작프로그램 목록 분석" ]
echo.
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\Windows\CurrentVersion\Run"    			  
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
    
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 Windows 2012 서버 이후 버전의 경우 시작프로그램 목록 편집이 불가능하며 별도의 편집이나 등록을 위해서는 배치파일이나 레지스트리 값 추가를 이용해서 개인화를 통해 사용할 수 있으나 보안상 권장하지 않음
)