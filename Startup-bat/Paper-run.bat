@echo off
cd ../Servers/PaperMC
title Paper-run.bat
echo %java_Xms_M_re%

pause 

java -Xms1024M -Xmx1024M -jar paper-1.21.1-85.jar
exit /b