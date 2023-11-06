@echo off
echo ###################################################################################
echo [W07] 서비스 관리 - 공유 권한 및 사용자 그룹 설정
echo.

echo ■ 진단 기준
echo 	양호 : 일반 공유 디렉토리가 없거나 공유 디렉토리 접근 권한에 Everyone 권한이 없음.
echo 	취약 : 일반 공유 디렉토리의 접근 권한에 Everyone 권한이 있음.
echo.
echo.

set /a "flag=0"
echo ■ 진단 결과
for /f "tokens=1" %%a in ('net share') do (
	if NOT "%%a" == "-------------------------------------------------------------------------------" (
		if NOT "%%a" == "공유" (
			if NOT "%%a" == "C$" (
				if NOT "%%a" == "D$" (
					if NOT "%%a" == "IPC$" (
						if NOT "%%a" == "ADMIN$" (
							if NOT "%%a" == "명령을" (
								set "shareDir=%%a"
								for /f "tokens=1-4" %%a in ('net share %shareDir%') do (
									if "%%a" == "사용" (
										if /i "%%c" == "Everyone," (
											if NOT "%%d" == "없음" (
												set /a "flag=1"
												echo %shareDir%	: Everyone 권한
											)
										)

									)
								)
							) else (
								goto break
							)
						)
					)
				)
			)
		)
	)
)
:break
if %flag% EQU 1 (
	echo 	→ 취약 ^(공유 디렉토리에 Everyone 권한이 설정되어 있음^)
	echo.
	echo.
	echo ■ 조치 방안
	echo 	Step1^) 시작 -^> 실행 -^> FSMGMT.MSC -^> 공유
	echo 	Step2^) 사용 권한에서 Everyone 으로 된 공유를 제거하고 접근이 필요한 계정의 적절한 권한 추가
	call %CHK_FILE% WARN %1
) else (
	echo 	→ 양호 ^(공유 디렉토리에 Everyone 권한이 설정되어 있지 않음^)
	call %CHK_FILE% SAFE %1
)
