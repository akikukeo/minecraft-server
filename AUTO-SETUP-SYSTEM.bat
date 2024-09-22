@echo off
setlocal enabledelayedexpansion


@REM config.ini を読み込む
    cd Setup-bat
    @REM config.ini を読み込む
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
        set %%a=%%b
    )

    @REM @REM RESET の確認
    @REM echo !RED!This is a test message!RESET!
    @REM cd

@REM callする
    call set.bat
    @REM tmp確認用待機(削除する)
        echo !LOG![LOG]!RESET! !echo1!
        timeout /t 10 /nobreak
        echo !LOG![LOG]!RESET! !echo2!

    call temp-del.bat


endlocal
pause