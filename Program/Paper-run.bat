@echo off
chcp 65001 > NUL
setlocal enabledelayedexpansion

@REM config 読み込み
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
    set %%a=%%b
    )

cd ../Servers/PaperMC
title Paper-run.bat
pause

java !java_Xms_M_re!

endlocal
exit /b
=======
@echo off
setlocal enabledelayedexpansion
chcp 932

@REM config 取得
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
    set %%a=%%b
    )

cd ../Servers/PaperMC
title Paper-run.bat

@REM サーバーを起動するコマンド
    java !java_Xms_M_re!

endlocal
exit /b