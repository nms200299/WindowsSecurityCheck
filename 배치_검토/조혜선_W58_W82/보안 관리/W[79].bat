@echo off
echo ###################################################################################
echo [W79] 보안 관리 - 파일 및 디렉터리 보호
echo.

echo ■ 진단 기준
echo 	양호 : NTFS 파일 시스템을 사용함.
echo 	취약 : FAT파일 시스템을 사용함.
echo.
echo.

echo ■ 진단 결과
fsutil fsinfo volumeinfo c:| find /I "시스템" | find /i "FAT"
if %errorlevel% EQU 0 (
	echo 	→ 양호 ^(NTFS 파일 시스템을 사용함.^)
    call %CHK_FILE% SAFE %1
) else (
	echo 	→ 취약 ^(FAT파일 시스템을 사용함.^)
    echo ■ 조치 방안
	echo 	Step1^) 명령어 프롬프트[DOS창]에서 다음과 같이 입력 시작> 실행> CMD> convert 드라이브명: /fs:ntfs
	echo    예: convert F: /fs/ntfs라고 입력하면 F 드라이브는 NTFS 형식으로 포맷됨
    call %CHK_FILE% PWN %1
)
echo.
echo.