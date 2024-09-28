@echo off
title Auto-startup.bat
@chcp 65001
setlocal enabledelayedexpansion

@REM 設定する

    @REM config読みこみ
        for /f "tokens=1,2 delims==" %%a in (config.ini) do (
        set %%a=%%b
        )

    @REM タイムスタンプの設定
        for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value ^| find "="') do set datetime=%%a
        set time=!datetime:~8,6!   :: HHMMSS

    @REM タイムスタンプを[時:分:秒]形式に変更
        set hour=!time:~0,2!
        set minute=!time:~2,2!
        set second=!time:~4,2!
        set timestamp=[!hour!:!minute!:!second!]

    echo !timestamp!!SUC! 設定読み込みが完了しました。

    @REM オプションの設定

        @REM デバッグオプションの設定
            if "!DEBUG_MODE!"=="true" (
                echo !timestamp!!DBG! デバッグオプションが""有効化""されています。configで設定できます。
            ) else (
                echo !timestamp!!DBG! デバッグオプションが""無効化""されています。configで設定できます。
            )

        @REM テストオプションの設定
            if "!TESTING_MODE!"=="true" (
                echo !timestamp!!DBG! テストオプションが""有効化""されています。configで設定できます。

                echo !timestamp!!DBG! テストモードのためbatは実行されません!
            ) else (
                echo !timestamp!!DBG! テストオプションが""無効化""されています。configで設定できます。
            )
            pause


@REM 使わない（機能追加）
    @REM @REM java引数の設定

    @REM     @REM configから読み込む
    @REM         echo !timestamp!!LOG! java引数を読み込みます...
    @REM         set java_Xm_xs_M=-Xms!java_Xms_M!M -Xmx!java_Xmx_M!M
    @REM         echo !timestamp!!SUC! java引数の設定が完了しました。

@REM 起動する

    echo !timestamp!!LOG! 起動を開始します...
    cd Servers

    @REM bungeecord起動
        if "!TESTING_MODE!"=="true" (
            cd BungeeCord
            @REM start run.bat
            echo !timestamp!!DBG! テストモードのためbatは実行されませんでした!
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! BungeeCordフォルダのrun.batをstartで起動完了)
            cd ..\
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! Serversフォルダに移動完了)
            echo !timestamp!!LOG! BungeeCordを起動しました。
        ) else (
            cd BungeeCord
            start run.bat
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! BungeeCordフォルダのrun.batをstartで起動完了)
            cd ..\
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! Serversフォルダに移動完了)
            echo !timestamp!!LOG! BungeeCordを起動しました。
        )

    @REM lobby起動
        if "!TESTING_MODE!"=="true" (
            cd lobby
            @REM start run.bat
            echo !timestamp!!DBG! テストモードのためbatは実行されませんでした!
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! lobbyフォルダのrun.batをstartで起動完了)
            cd ..\
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! Serversフォルダに移動完了)
            echo !timestamp!!LOG! lobbyを起動しました。
        ) else (
            cd lobby
            start run.bat
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! lobbyフォルダのrun.batをstartで起動完了)
            cd ..\
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! Serversフォルダに移動完了)
            echo !timestamp!!LOG! lobbyを起動しました。
        )

    @REM main起動
        if "!TESTING_MODE!"=="true" (
            cd main
            @REM start run.bat
            echo !timestamp!!DBG! テストモードのためbatは実行されませんでした!
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! mainフォルダのrun.batをstartで起動完了)
            cd ..\
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! Serversフォルダに移動完了)
            echo !timestamp!!LOG! mainを起動しました。
        ) else (
            cd main
            start run.bat
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! mainフォルダのrun.batをstartで起動完了)
            cd ..\
            if "!DEBUG_MODE!"=="true" ( echo !timestamp!!DBG! Serversフォルダに移動完了)
            echo !timestamp!!LOG! mainを起動しました。
        )
    
    echo !timestamp!!SUC! 登録プログラムを起動しました。キーを押して終了...

    if "!DEBUG_MODE!"=="true" (
        echo !timestamp!!DBG! 登録プログラム一覧
        echo !timestamp!!DBG!  ------------------
        echo !timestamp!!DBG!  BungeeCord\run.bat
        echo !timestamp!!DBG!  lobby\run.bat
        echo !timestamp!!DBG!  main\run.bat
        echo !timestamp!!DBG!  ------------------
    )

pause
endlocal
exit