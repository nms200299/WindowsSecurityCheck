@echo off

echo. W-79 파일 및 디렉터리 보호
echo.
echo [ W-79 "파일 및 디렉터리 보호" ]
echo.
fsutil fsinfo volumeinfo c:| find /I "시스템" | find /i "FAT"
echo.
if errorlevel 1 (
    echo ■ 결과: 양호
) else (
    echo ■ 결과: 취약
    echo ■ 조치 방안
    echo Step 1 : 명령어 프롬프트[DOS창]에서 다음과 같이 입력 시작> 실행> CMD> convert 드라이브명: /fs:ntfs
    echo 예: convert F: /fs/ntfs라고 입력하면 F 드라이브는 NTFS 형식으로 포맷됨
)