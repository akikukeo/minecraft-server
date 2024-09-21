@echo off
title Auto-startup.bat
setlocal enabledelayedexpansion

cd ./Startup-bat

for /f "tokens=1,2 delims==" %%a in (config.txt) do (
 set %%a=%%b
)

echo %cd%
echo %java_Xms_M%
set java_Xms_M_re=-Xms1024M -Xmx1024M -jar paper-1.21.1-85.jar
echo %java_Xms_M_re%

pause

call Paper-run.bat

pause