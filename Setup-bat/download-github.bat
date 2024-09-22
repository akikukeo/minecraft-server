@echo off
setlocal enabledelayedexpansion

@REM config.ini を読み込む
    @REM config.ini を読み込む
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
        set %%a=%%b
    )

cd install

@REM curlを使ってリポジトリをダウンロード
    echo Downloading repository...
    curl -L -o !ZIP_FILE! !GITHUB_URL!

@REM ダウンロードが成功したかを確認
    if not exist !ZIP_FILE! (
        echo !ERROR![ERROR]!RESET! ダウンロードに失敗しました。処理を終了します。
        pause
        exit /b 1
    )  else (
            echo !LOG![LOG]!RESET! ダウンロードが完了しました。
    )


@REM tarを使ってZIPファイルを解凍
    echo !LOG![LOG]!RESET! ZIPを展開しています...
    tar -xf !ZIP_FILE!

@REM 解凍が成功したかを確認
    if not exist !EXTRACT_DIR! (
        echo !LOG![LOG]!RESET! 展開に失敗しました。処理を終了します。
        pause
        exit /b 1
    )

@REM ダウンロードしたZIPファイルを削除
    echo !LOG![LOG]!RESET! ZIPを削除しています...
    del !ZIP_FILE!

echo !LOG![LOG]!RESET! すべてのダウンロードが完了しました。
pause
endlocal
exit /b 0