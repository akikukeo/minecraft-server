@echo off
setlocal enabledelayedexpansion

set wget_log_pass=

@REM config.ini を読み込む
    @REM config.ini を読み込む
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
        set %%a=%%b
    )

@REM カレントディレクトリを表示
    echo Current directory: %CD%

pause
@REM wgetを使ってリポジトリをダウンロード

    
@REM ダウンロードが成功したかを確認
    if not exist %ZIP_FILE% (
        echo Download failed. Exiting.
        pause
        exit /b 1
    )

@REM tarを使ってZIPファイルを解凍
    echo Extracting ZIP file...
    tar -xf %ZIP_FILE%

@REM 解凍が成功したかを確認
    if not exist %EXTRACT_DIR% (
        echo Extraction failed. Exiting.
        pause
        exit /b 1
    )

@REM ダウンロードしたZIPファイルを削除
    echo Cleaning up...
    del %ZIP_FILE%

echo Done.
pause
endlocal
exit /b 0