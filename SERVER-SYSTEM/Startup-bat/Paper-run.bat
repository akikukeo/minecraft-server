@echo off
cd ../Servers/PaperMC
title Paper-run.bat

echo %java_Xms_M_re%

:: サーバーを起動するコマンド
java %java_Xms_M_re%

exit /b
