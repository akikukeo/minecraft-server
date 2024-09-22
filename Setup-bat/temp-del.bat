@echo off
setlocal

@REM config.ini を読み込む
    @REM config.ini を読み込む
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
        set %%a=%%b
    )

@REM ディレクトリを指定
    cd .temp

@REM 削除プロセス
    @REM.tmp ファイルの存在を確認
        set FILE_PATTERN=*.tmp
        set FILE_COUNT=0

    @REM 存在する.tmpファイルのカウント
        for %%F in (%FILE_PATTERN%) do (
            set /a FILE_COUNT+=1
        )

    @REM.tmp ファイルが存在しない場合、エラーを表示
        if %FILE_COUNT%==0 (
            echo !ERROR![ERROR]!RESET! !echo3!
            exit /b 1
        )

    @REM.tmp ファイルを削除
        echo !LOG![LOG]!RESET! !echo4!
        del /q "%FILE_PATTERN%"

    @REM 削除結果を表示
        if errorlevel 1 (
            echo !ERROR![ERROR]!RESET! !echo5!
            exit /b 1
        ) else (
            echo !LOG![LOG]!RESET! !echo6!
        )


endlocal
exit /b 0