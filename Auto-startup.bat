@echo off
title Auto-startup.bat
chcp 65001
setlocal enabledelayedexpansion

@REM config読み
    echo コンフィグを読み込んでいます...
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
    set %%a=%%b
    )
    echo 読み込みが完了しました。

@REM set java_Xms_M_re=-Xms%java_Xms_M%M -Xmx%java_Xms_M%M -jar paper-1.21.1-85.jar
@REM start Paper-run.bat

endlocal
exit