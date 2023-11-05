@echo off
setlocal enabledelayedexpansion

set "path=.\module\tmp"

if /i %1 == TOTAL (
    for /f %%a in (%path%\CHK_TOTAL) do (
        set /a cnt=%%a+1
        echo !cnt! > %path%\\CHK_TOTAL
    )
)
rem 전체 진단 항목 수 카운트


if /i %1 == SAFE (
    for /f %%a in (%path%\CHK_SAFE) do (
        set /a cnt=%%a+1
        echo !cnt! > %path%\\CHK_SAFE
    )
)
rem 양호한 항목 수 카운트


if /i %1 == WARN (
    for /f %%a in (%path%\CHK_WARN) do (
        set /a cnt=%%a+1
        echo !cnt! > %path%\CHK_WARN
    )
)
rem 주의할 항목 수 카운트


if /i %1 == PWN (
    for /f %%a in (%path%\CHK_PWN) do (
        set /a cnt=%%a+1
        echo !cnt! > %path%\CHK_PWN
    )
)
rem 취약한 항목 수 카운트
