@echo off
net session >nul 2>&1
if %errorlevel% EQU 2 (
	echo.
	echo ��ũ��Ʈ�� ������ �������� �������ּ���.
	echo ��ũ��Ʈ�� �����մϴ�.
	echo.
	pause
	exit
) else (
	cd /d %~dp0
	rem ������ �������� �����, system32 ��η� �۾� ���͸��� �ٲ�� ���� ��������.
)


:start
cls
echo __        ___           _                                            
echo \ \      / (_)_ __   __^| ^| _____      _____                          
echo  \ \ /\ / /^| ^| '_ \ / _` ^|/ _ \ \ /\ / / __^|                         
echo   \ V  V / ^| ^| ^| ^| ^| (_^| ^| (_) \ V  V /\__ \                         
echo  __\_/\_/  ^|_^|_^| ^|_^|\__,_^|\___/ \_/\_/ ^|___/___ _               _    
echo / ___^|  ___  ___ _   _ _ __(_) ^|_ _   _   / ___^| ^|__   ___  ___^| ^| __
echo \___ \ / _ \/ __^| ^| ^| ^| '__^| ^| __^| ^| ^| ^| ^| ^|   ^| '_ \ / _ \/ __^| ^|/ /
echo  ___) ^|  __/ (__^| ^|_^| ^| ^|  ^| ^| ^|_^| ^|_^| ^| ^| ^|___^| ^| ^| ^|  __/ (__^|   ^< 
echo ^|____/ \___^|\___^|\__,_^|_^|  ^|_^|\__^|\__, ^|  \____^|_^| ^|_^|\___^|\___^|_^|\_\
echo                                  ^|___/                              
echo                    (�ߺδ��б� ��������ܹ��� 02�й� 1�� : ���� ��)
echo.
echo  ______________________________________________________________________________
echo ^| �� ��         ^| ���̵� ^| �� ��	
echo  ------------------------------------------------------------------------------
echo ^| 1. ���� ����  ^| ��     ^| W01. Administrator ���� �̸� �ٲٱ�
echo ^|               ^| ��     ^| W02. Guest ���� ����
echo ^| (18�� �׸�)   ^| ��     ^| W03. ���ʿ��� ���� ����
echo ^|               ^| ��     ^| W04. ���� ��� �Ӱ谪 ����
echo ^|               ^| ��     ^| W05. �ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ���� ����
echo ^|               ^| ��     ^| W06. ������ �׷쿡 �ּ����� ����� ����
echo ^|               ^|   ��   ^| W46. Everyone �������� �͸� ����ڿ� ���� ����
echo ^|               ^|   ��   ^| W47. ���� ��� �Ⱓ ����
echo ^|               ^|   ��   ^| W48. �н����� ���⼺ ����
echo ^|               ^|   ��   ^| W49. �н����� �ּ� ��ȣ ����
echo ^|               ^|   ��   ^| W50. �н����� �ִ� ��� �Ⱓ
echo ^|               ^|   ��   ^| W51. �н����� �ּ� ��� �Ⱓ
echo ^|               ^|   ��   ^| W52. ������ ����� �̸� ǥ�� ����
echo ^|               ^|   ��   ^| W53. ���� �α׿� ���
echo ^|               ^|   ��   ^| W54. �͸� SID/�̸� ��ȯ ��� ����
echo ^|               ^|   ��   ^| W55. �ֱ� ��ȣ ���
echo ^|               ^|   ��   ^| W56. �ܼ� �α׿� �� ���� �������� �� ��ȣ ��� ����
echo ^|               ^|   ��   ^| W57. �����͹̳� ���� ������ ����� �׷� ����
echo  ------------------------------------------------------------------------------
echo ^| 2. ���� ����^| ��     ^| W07. ���� ���� �� ����� �׷� ����
echo ^|               ^| ��     ^| W08. �ϵ��ũ �⺻ ���� ����
echo ^| (36�� �׸�)   ^| ��     ^| W09. ���ʿ��� ���� ����
echo ^|               ^| ��     ^| W10. IIS ���� ���� ����
echo ^|               ^| ��     ^| W11. IIS ���丮 ������ ����
echo ^|               ^| ��     ^| W12. CGI ���� ����
echo ^|               ^| ��     ^| W13. IIS ���� ���丮 ���� ����
echo ^|               ^| ��     ^| W14. ���ʿ��� ���� ����
echo ^|               ^| ��     ^| W15. �����μ��� ���� ����
echo ^|               ^| ��     ^| W16. IIS ��ũ ��� ����
echo ^|               ^| ��     ^| W17. IIS ���� ���ε� �� �ٿ�ε� ����
echo ^|               ^| ��     ^| W18. IIS DB ���� ����� ����
echo ^|               ^| ��     ^| W19. IIS ���� ���丮 ����
echo ^|               ^| ��     ^| W20. IIS ���������� ACL ����
echo ^|               ^| ��     ^| W21. IIS �̻�� ��ũ��Ʈ ���� ����
echo ^|               ^| ��     ^| W22. IIS Exec ��ɾ� �� ȣ�� ����
echo ^|               ^| ��     ^| W23. IIS WebDAV ��Ȱ��ȭ
echo ^|               ^| ��     ^| W24. NetBIOS ���ε� ���� ���� ����
echo ^|               ^| ��     ^| W25. FTP ���� ���� ����
echo ^|               ^| ��     ^| W26. FTP ���丮 ���� ���� ����
echo ^|               ^| ��     ^| W27. Anonymous FTP ���� ����
echo ^|               ^| ��     ^| W28. FTP ���� ���� ����
echo ^|               ^| ��     ^| W29. DNS Zone Transfer ����
echo ^|               ^| ��     ^| W30. RDS(Remote Data Services) ����
echo ^|               ^| ��     ^| W31. �ֽ� ������ ����
echo ^|               ^|   ��   ^| W58. �͹̳� ���� ��ȣȭ ���� ����
echo ^|               ^|   ��   ^| W59. IIS �� ���� ���� ����
echo ^|               ^|   ��   ^| W60. SNMP ���� ���� ����
echo ^|               ^|   ��   ^| W61. SNMP ���� Ŀ�´�Ƽ��Ʈ���� ���⼺ ����
echo ^|               ^|   ��   ^| W62. SNMP Access control ����
echo ^|               ^|   ��   ^| W63. DNS ���� ���� ����
echo ^|               ^|     �� ^| W64. HTTP/FTP/SMTP ��� ����
echo ^|               ^|   ��   ^| W65. Telnet ���� ����
echo ^|               ^|   ��   ^| W66. ���ʿ��� ODBC/OLE-DB �����ͼҽ��� ����̺� ����
echo ^|               ^|   ��   ^| W67. �����͹̳� ���� Ÿ�Ӿƿ� ����
echo ^|               ^|   ��   ^| W68. ����� �۾��� �ǽɽ����� ����� ��ϵǾ� �ִ��� ����
echo  ------------------------------------------------------------------------------
echo ^| 3. ��ġ ����  ^| ��     ^| W32. �ֽ� HOT FIX ����
echo ^|               ^| ��     ^| W33. ��� ���α׷� ������Ʈ
echo ^| (3�� �׸�)    ^|   ��   ^| W69. ��å�� ���� �ý��� �α뼳��
echo  ------------------------------------------------------------------------------
echo ^| 4. �α� ����  ^| ��     ^| W34. �α��� ������ ���� �� ����
echo ^|               ^| ��     ^| W35. �������� ������ �� �� �ִ� ������Ʈ�� ���
echo ^| (4�� �׸�)    ^|     �� ^| W70. �̺�Ʈ �α� ���� ����
echo ^|               ^|   ��   ^| W71. ���ݿ��� �̺�Ʈ �α����� ���� ����
echo  ------------------------------------------------------------------------------
echo ^| 5. ���� ����  ^| ��     ^| W36. ��� ���α׷� ��ġ
echo ^|               ^| ��     ^| W37. SAM ���� ���� ���� ����
echo ^| (20�� �׸�)   ^| ��     ^| W38. ȭ�麸ȣ�� ����
echo ^|               ^| ��     ^| W39. �α׿� ���� �ʰ� �ý��� ���� ��� ����
echo ^|               ^| ��     ^| W40. ���� �ý��ۿ��� ������ �ý��� ����
echo ^|               ^| ��     ^| W41. ���Ȱ��縦 �α��� �� ���� ��� ��� �ý��� ���� ����
echo ^|               ^| ��     ^| W42. SAM ������ ������ �͸� ���� ��� ����
echo ^|               ^| ��     ^| W43. Autologin ��� ����
echo ^|               ^| ��     ^| W44. �̵��� �̵�� ���� �� ������ ���
echo ^|               ^| ��     ^| W45. ��ũ ���� ��ȣȭ ����
echo ^|               ^|   ��   ^| W72. Dos ���� ��� ������Ʈ�� ����
echo ^|               ^|   ��   ^| W73. ����ڰ� ������ ����̹��� ��ġ�� �� ���� ��
echo ^|               ^|   ��   ^| W74. ���� ������ �ߴ��ϱ� ���� �ʿ��� ���޽ð�
echo ^|               ^|     �� ^| W75. ��� �޽��� ����
echo ^|               ^|   ��   ^| W76. ����ں� Ȩ ���丮 ���� ����
echo ^|               ^|   ��   ^| W77. LAN Manager ���� ����
echo ^|               ^|   ��   ^| W78. ���� ä�� ������ ������ ��ȣȭ �Ǵ� ����
echo ^|               ^|   ��   ^| W79. ���� �� ���丮 ��ȣ
echo ^|               ^|   ��   ^| W80. ��ǻ�� ���� ��ȣ �ִ� ��� �Ⱓ
echo ^|               ^|   ��   ^| W81. ���� ���α׷� ��� �м�
echo  ------------------------------------------------------------------------------
echo ^| 6. DB ����    ^| ��     ^| W82. Windows ���� ��� ���
echo ^|               ^|        ^|
echo ^| (1�� �׸�)    ^|        ^|
echo  ------------------------------------------------------------------------------
echo Usage : W[nn] = ���� ���� (ex. W01)
echo         [1~6] = �׸� ���� (ex. 1)
echo         ALL   = ��ü ����
echo         EXIT  = ���α׷� ����
echo  ------------------------------------------------------------------------------

set "TMP_PATH=.\module\tmp"
set "SCR_PATH=.\module\script"

del /F /Q "%TMP_PATH%\*" > NUL
rem �ӽ÷� ������ ��å �� ���� ������ ��� ������(/F) ���� �ʰ�(/Q) ����������.

set "choice="
rem �Է� ���� �� ���� ���� ��, ���� ���� ����ϴ� ���� ���� ���� �ʱ�ȭ.
set /p choice=input : 
setlocal enabledelayedexpansion

echo.
if "%choice%" == "" (
	echo Syntax Error!
	pause
	goto start
)
rem �Է� ���� �� ���� ���� ���� ��� ��, �ǵ��ư�.

set "logFileName=%date%_%time%.log"
set "logFileName=!logFileName::=.!"
rem ������ Ȯ�� ���� �������� :�� .���� ��ü
rem (���� �̸����� :�� ����� �� ����)
set "logFileName=!logFileName: =0!"
rem ������ Ȯ�� ���� �������� ������ 0���� ��ü
rem (n�� nn�������� ��ȯ)

echo 0 > "%TMP_PATH%\CHK_TOTAL_CNT"
echo 0 > "%TMP_PATH%\CHK_SAFE_CNT"
echo 0 > "%TMP_PATH%\CHK_WARN_CNT"
echo 0 > "%TMP_PATH%\CHK_PWN_CNT"
set "CHK_FILE=.\module\mod_cntChkState.bat"

for /F %%a in (./FTP_PATH.txt) do (
	set "FTP_PATH=%%a"
)
for /F %%a in (./IIS_PATH.txt) do (
	set "IIS_PATH=%%a"
)

if "%choice:~0,1%" == "W" (
rem �Է� �� �� �� ���ڰ� W�̸� [���� ����]�� �ǹ���.
	if "%choice:~2,1%" == "" (
		set "choice=W0%choice:~1,1%"
		rem �׸� ��ȣ�� nn�� �ƴ� n ������ ���('W1'), nn ����('W01')���� ������.
	)

	if NOT EXIST "%SCR_PATH%\!choice!.bat" (
		echo Not found script file.
		pause
		goto start
	)

	call %CHK_FILE% TOTAL
	echo @ !choice! ���� ���� > ".\log\%logFileName%"
	call "%SCR_PATH%\!choice!.bat" !choice! >> ".\log\%logFileName%"
	rem ���� ��ũ��Ʈ�� �����ϰ�, log ���Ϸ� ����
	type ".\log\%logFileName%"
	rem ����� log ������ ���

) else (
	if /i %choice% == ALL (
		for /L %%A in (1,1,9) do (
			call %CHK_FILE% TOTAL
			call "%SCR_PATH%\W0%%A.bat" %%A > "%TMP_PATH%\LOG_TEMP"
			rem ���� ��ũ��Ʈ�� �����ϰ�, LOG_TEMP ���Ϸ� ����
			type "%TMP_PATH%\LOG_TEMP"
			type "%TMP_PATH%\LOG_TEMP" >> ".\log\%logFileName%"
			rem LOG_TEMP ������ ����ϰ�, log ���Ϸ� ���� 
		)
		for /L %%A in (10,1,68) do (
			call %CHK_FILE% TOTAL
			call "%SCR_PATH%\W%%A.bat" %%A > "%TMP_PATH%\LOG_TEMP"
			rem ���� ��ũ��Ʈ�� �����ϰ�, LOG_TEMP ���Ϸ� ����
			type "%TMP_PATH%\LOG_TEMP"
			type "%TMP_PATH%\LOG_TEMP" >> ".\log\%logFileName%"
			rem LOG_TEMP ������ ����ϰ�, log ���Ϸ� ���� 
		)
	) else (

		if /i %choice% == EXIT (
			exit
			rem �Է� ���� EXIT��, ��ġ ������ ������.
		) else (

			if %choice% GEQ 1 (
				if %choice% LEQ 6 (
					rem �Է� ���� 1~6�̸� [�׸� ����]�� �ǹ���.
					echo @ !choice!�� �׸� ���� > ".\log\%logFileName%"
					for /f "tokens=*" %%A in (.\module\schedule\%choice%.txt) do (
						call %CHK_FILE% TOTAL
						call "%SCR_PATH%\%%A.bat" %%A > "%TMP_PATH%\LOG_TEMP"
						rem ���� ��ũ��Ʈ�� �����ϰ�, LOG_TEMP ���Ϸ� ����
						type "%TMP_PATH%\LOG_TEMP"
						type "%TMP_PATH%\LOG_TEMP" >> ".\log\%logFileName%"
						rem LOG_TEMP ������ ����ϰ�, log ���Ϸ� ���� 
					)
				) else (
					echo Syntax Error!
					goto start
				)
			) else (
				echo Syntax Error!
				goto start
			)
			rem �Է� ���� 1~6�̸� �׸� ������ �����ϰ�,
			rem �ƴϸ� �������� �޽����� ����.
		)
	)
)

call .\module\mod_cntChkPrint.bat > %TMP_PATH%\LOG_TEMP
rem ���� ����� ����ϴ� ��ġ������ ȣ���Ѵ�.

type "%TMP_PATH%\LOG_TEMP"
type "%TMP_PATH%\LOG_TEMP" >> .\log\%logFileName%
rem LOG_TEMP ������ ����ϰ�, log ���Ϸ� ���� 

del /F /Q "%TMP_PATH%\*" > NUL
rem �ӽ÷� ������ ��å �� ���� ������ ��� ������(/F) ���� �ʰ�(/Q) ����������.
pause
endlocal
goto start
