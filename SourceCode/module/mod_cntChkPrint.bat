@echo off
rem set "TMP_PATH=.\module\tmp"
echo ###################################################################################
echo.

for /f %%a in (%TMP_PATH%\CHK_TOTAL) do (set /a CHK_TOTAL=%%a)
for /f %%a in (%TMP_PATH%\CHK_SAFE) do (set /a CHK_SAFE=%%a)
for /f %%a in (%TMP_PATH%\CHK_WARN) do (set /a CHK_WARN=%%a)
for /f %%a in (%TMP_PATH%\CHK_PWN) do (set /a CHK_PWN=%%a)

echo 전체 진단 항목 : %CHK_TOTAL%개
echo 양호한 항목 : %CHK_SAFE%개
echo 주의할 항목 : %CHK_WARN%개
echo 취약한 항목 : %CHK_PWN%개
echo.
echo 로그 파일 경로 : .\log\%logFileName%
echo.
