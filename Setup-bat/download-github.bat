@echo off
setlocal

@REM config.ini を読み込む
    @REM config.ini を読み込む
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
        set %%a=%%b
    )

echo %GITHUB_URL%
cd install
pause

@REM curlを使ってリポジトリをダウンロード
    echo Downloading repository...
    curl -L -o %ZIP_FILE% %GITHUB_URL%

@REM ダウンロードが成功したかを確認
    if not exist %ZIP_FILE% (
        echo ダウンロードに失敗しました。処理を終了します。
        pause
        exit /b 1
    )  else (
            echo %LOG%[LOG]%RESET% ダウンロードが完了しました。
    )

pause

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