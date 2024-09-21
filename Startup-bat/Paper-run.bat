@echo off
cd ../Servers/PaperMC
title Paper-run.bat

echo %java_Xms_M_re%

set java_Xms_M_re=-Xms%java_Xms_M%M -Xmx%java_Xms_M%M -jar paper-1.21.1-85.jar

:: サーバーを起動するコマンド
java %java_Xms_M_re%

exit /b
