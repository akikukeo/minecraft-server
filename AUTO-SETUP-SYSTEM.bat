@echo off
chcp 932
setlocal enabledelayedexpansion
title 自動ダウンロードシステム実行中...

set GITHUB_URL=https://github.com/akikukeo/minecraft-server/archive/refs/heads/inst-sys.zip
set ZIP_FILE=.\minecraft-server-inst-sys.zip
set EXTRACT_DIR=.\minecraft-inst-sys



    md install
    cd install
    
@REM curlを使ってリポジトリをダウンロード
    echo Downloading repository...
    curl -L -o %ZIP_FILE% %GITHUB_URL%

@REM ダウンロードが成功したかを確認
    if not exist %ZIP_FILE% (
        echo %ERROR_R% ダウンロードに失敗しました。処理を終了します。
        exit /b 1
    )  else (
            echo %LOG_R% ダウンロードが完了しました。
    )

@REM tarを使ってZIPファイルを解凍
    echo %LOG_R% ZIPを展開しています...
    tar -xf %ZIP_FILE%

@REM 解凍が成功したかを確認
    if not exist %EXTRACT_DIR% (
        echo %LOG_R% 展開に失敗しました。処理を終了します。
        exit /b 1
    )

@REM ダウンロードしたZIPファイルを削除
    echo %LOG_R% ZIPを削除しています...
    del %ZIP_FILE%

echo %LOG_R% すべてのダウンロードが完了しました。
endlocal
pause
exit /b 0