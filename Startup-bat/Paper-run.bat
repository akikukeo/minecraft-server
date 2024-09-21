@echo off
cd ../Servers/PaperMC
title Paper-run.bat

for /f "tokens=1,* delims==" %%a in (config.txt) do (
    set %%a=%%b
)

pause 

java -Xms1024M -Xmx1024M -jar paper-1.21.1-85.jar
exit /b