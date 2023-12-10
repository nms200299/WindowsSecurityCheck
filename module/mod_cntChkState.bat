@echo off
setlocal enabledelayedexpansion

set "path=.\module\tmp"

if /i %1 == TOTAL (
    for /f %%a in (%path%\CHK_TOTAL_CNT) do (
        set /a cnt=%%a+1
        echo !cnt! > %path%\CHK_TOTAL_CNT
    )
)
rem 전체 진단 항목 수 카운트


if /i %1 == SAFE (
    for /f %%a in (%path%\CHK_SAFE_CNT) do (
        set /a cnt=%%a+1
        echo !cnt! > %path%\CHK_SAFE_CNT
    )
)
rem 양호한 항목 수 카운트


if /i %1 == WARN (
    for /f %%a in (%path%\CHK_WARN_CNT) do (
        set /a cnt=%%a+1
        echo !cnt! > %path%\CHK_WARN_CNT
    )
    if "%2" NEQ "" (
        echo                        %2 >> %path%\CHK_WARN_NUM
    )
)
rem 주의할 항목 수 카운트


if /i %1 == PWN (
    for /f %%a in (%path%\CHK_PWN_CNT) do (
        set /a cnt=%%a+1
        echo !cnt! > %path%\CHK_PWN_CNT
    )
    if "%2" NEQ "" (
        echo                        %2 >> %path%\CHK_PWN_NUM
    )
)
rem 취약한 항목 수 카운트
