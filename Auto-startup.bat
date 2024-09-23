@echo off
title Auto-startup.bat
setlocal enabledelayedexpansion

cd ./Startup-bat
:: config Žæ“¾
for /f "tokens=1,2 delims==" %%a in (config.ini) do (
 set %%a=%%b
)

set java_Xms_M_re=-Xms%java_Xms_M%M -Xmx%java_Xms_M%M -jar paper-1.21.1-85.jar

call Paper-run.bat
endlocal
exit