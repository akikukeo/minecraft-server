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


@REM java引数の設定

    @REM configから読み込む
        echo !timestamp!!LOG! java引数を読み込みます...
        set java_Xm_xs_M=-Xms!java_Xms_M!M -Xmx!java_Xmx_M!M -jar paper-1.21.1-85.jar
        echo !timestamp!!SUC! java引数の設定が完了しました。
pause


endlocal
exit