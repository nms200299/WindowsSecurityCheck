@echo off
rem set "TMP_PATH=.\module\tmp"
echo ###################################################################################
echo.

for /f %%a in (%TMP_PATH%\CHK_TOTAL_CNT) do (set /a CHK_TOTAL_CNT=%%a)
for /f %%a in (%TMP_PATH%\CHK_SAFE_CNT) do (set /a CHK_SAFE_CNT=%%a)
for /f %%a in (%TMP_PATH%\CHK_WARN_CNT) do (set /a CHK_WARN_CNT=%%a)
for /f %%a in (%TMP_PATH%\CHK_PWN_CNT) do (set /a CHK_PWN_CNT=%%a)

echo [점검 항목 개수]
echo 	전체 진단 항목 : %CHK_TOTAL_CNT%개
echo 	양호한 항목 : %CHK_SAFE_CNT%개
echo 	주의할 항목 : %CHK_WARN_CNT%개
echo 	취약한 항목 : %CHK_PWN_CNT%개
echo.
echo.
echo [주의/취약 목록]
echo 	주의할 항목 :
type %TMP_PATH%\CHK_WARN_NUM
echo 	취약한 항목 :
type %TMP_PATH%\CHK_PWN_NUM
echo.
echo.

echo 로그 파일 경로 : .\log\%logFileName%
echo.
