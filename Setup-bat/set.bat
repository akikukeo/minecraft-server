@echo off
setlocal enabledelayedexpansion

@REM GitHubリポジトリの情報を設定
    set GITHUB_URL=https://github.com/akikukeo/minecraft-server/archive/refs/heads/main.zip
    set ZIP_FILE=.\minecraft-server.zip
    set EXTRACT_DIR=.\minecraft-server-main



@REM.tmp に書き込む
    echo !LOG_R! tmpファイルを書き込み中...
    (
        echo [download-github.bat]
        echo GITHUB_URL=%GITHUB_URL%
        echo ZIP_FILE=%ZIP_FILE%
        echo EXTRACT_DIR=%EXTRACT_DIR%
    ) > ./.temp/test.tmp

    if errorlevel 1 (
        echo !ERROR_R! 書き込めませんでした。処理を終了します。
        exit /b 1
    ) else (
        echo !LOG_R! 書き込みが完了しました。
    )

endlocal
exit /b 0