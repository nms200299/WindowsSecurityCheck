@echo off
rem set "TMP_PATH=.\module\tmp"
echo ###################################################################################
echo.

for /f %%a in (%TMP_PATH%\CHK_TOTAL) do (set /a CHK_TOTAL=%%a)
for /f %%a in (%TMP_PATH%\CHK_SAFE) do (set /a CHK_SAFE=%%a)
for /f %%a in (%TMP_PATH%\CHK_WARN) do (set /a CHK_WARN=%%a)
for /f %%a in (%TMP_PATH%\CHK_PWN) do (set /a CHK_PWN=%%a)

echo ��ü ���� �׸� : %CHK_TOTAL%��
echo ��ȣ�� �׸� : %CHK_SAFE%��
echo ������ �׸� : %CHK_WARN%��
echo ����� �׸� : %CHK_PWN%��
echo.
echo �α� ���� ��� : .\log\%logFileName%
echo.
