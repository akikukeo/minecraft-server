@echo off
title Auto-startup.bat
chcp 932
setlocal enabledelayedexpansion

@REM proxサーバー起動
    cd Servers/Prox-velo
    start run.bat

cd ../../Startup-bat
@REM config読み
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
    set %%a=%%b
    )

set java_Xms_M_re=-Xms%java_Xms_M%M -Xmx%java_Xms_M%M -jar paper-1.21.1-85.jar
start Paper-run.bat

endlocal
exit