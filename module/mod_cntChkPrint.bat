@echo off
rem set "TMP_PATH=.\module\tmp"
echo ###################################################################################
echo.

for /f %%a in (%TMP_PATH%\CHK_TOTAL_CNT) do (set /a CHK_TOTAL_CNT=%%a)
for /f %%a in (%TMP_PATH%\CHK_SAFE_CNT) do (set /a CHK_SAFE_CNT=%%a)
for /f %%a in (%TMP_PATH%\CHK_WARN_CNT) do (set /a CHK_WARN_CNT=%%a)
for /f %%a in (%TMP_PATH%\CHK_PWN_CNT) do (set /a CHK_PWN_CNT=%%a)

echo [���� �׸� ����]
echo 	��ü ���� �׸� : %CHK_TOTAL_CNT%��
echo 	��ȣ�� �׸� : %CHK_SAFE_CNT%��
echo 	������ �׸� : %CHK_WARN_CNT%��
echo 	����� �׸� : %CHK_PWN_CNT%��
echo.
echo.
echo [����/��� ���]
echo 	������ �׸� :
if exist %TMP_PATH%\CHK_WARN_NUM ( 
	type %TMP_PATH%\CHK_WARN_NUM
) else (
	echo				����.
)
echo 	����� �׸� :
if exist %TMP_PATH%\CHK_PWN_NUM (
	type %TMP_PATH%\CHK_PWN_NUM
) else (
	echo				����.
)
echo.
echo.

echo �α� ���� ��� : .\log\%logFileName%
echo.
