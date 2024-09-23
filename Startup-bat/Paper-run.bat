@echo off
chcp 932
setlocal enabledelayedexpansion

:: config 蜿門ｾ
for /f "tokens=1,2 delims==" %%a in (config.ini) do (
 set %%a=%%b
)

cd ../Servers/PaperMC
title Paper-run.bat

:: 繧ｵ繝ｼ繝舌�繧定ｵｷ蜍輔☆繧九さ繝槭Φ繝
java !java_Xms_M_re!

endlocal
exit /b
=======
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