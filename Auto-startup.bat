@echo off
title Auto-startup.bat
setlocal enabledelayedexpansion
chcp 932

cd ./Startup-bat
:: config 取得
for /f "tokens=1,2 delims==" %%a in (config.ini) do (
 set %%a=%%b
)

set java_Xms_M_re=-Xms%java_Xms_M%M -Xmx%java_Xms_M%M -jar paper-1.21.1-85.jar

call Paper-run.bat
endlocal
exit