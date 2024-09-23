@echo off
setlocal enabledelayedexpansion
chcp 932

:: config 取得
for /f "tokens=1,2 delims==" %%a in (config.ini) do (
 set %%a=%%b
)

cd ../Servers/PaperMC
title Paper-run.bat

:: サーバーを起動するコマンド
java !java_Xms_M_re!

endlocal
exit /b
