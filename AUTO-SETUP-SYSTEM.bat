@echo off
chcp 932
setlocal enabledelayedexpansion
set title=自動セットアップシステム実行中...
title %title%

@REM config.ini を読み込む
    cd Setup-bat
    @REM config.ini を読み込む
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
        set %%a=%%b
    )



@REM ダウンロードする
    call download-github.bat
    if errorlevel 1 (
        title %title%
        echo !ERROR_R! 自動ダウンロードシステムの失敗を検知しました。処理を終了します。
    )
    if errorlevel 0 (
        title %title%
        echo !SUCCESS_R! 自動ダウンロードシステムの成功を検知しました。処理を終了します。
    )

    call java-inst.bat
    if errorlevel 1 (
        title %title%
        echo !ERROR_R! 自動ダウンロードシステムの失敗を検知しました。処理を終了します。
    )
    if errorlevel 0 (
        title %title%
        echo !SUCCESS_R! 自動ダウンロードシステムの成功を検知しました。処理を終了します。
    )

endlocal
pause