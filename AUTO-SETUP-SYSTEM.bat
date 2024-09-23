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

@REM @REM ダウンロードが成功したかを確認
@REM     if not exist %ZIP_FILE% (
@REM         echo %ERROR_R% ダウンロードに失敗しました。処理を終了します。
@REM         exit /b 1
@REM     )  else (
@REM             echo %LOG_R% ダウンロードが完了しました。
@REM     )

@REM tarを使ってZIPファイルを解凍
    echo %LOG_R% ZIPを展開しています...
    tar -xf %ZIP_FILE%

@REM @REM 解凍が成功したかを確認
@REM     if not exist %EXTRACT_DIR% (
@REM         echo %LOG_R% 展開に失敗しました。処理を終了します。
@REM         exit /b 1
@REM     )

@REM @REM ダウンロードしたZIPファイルを削除
@REM     echo %LOG_R% ZIPを削除しています...
@REM     del %ZIP_FILE%

echo すべてのダウンロードが完了しました。

cd minecraft-server-inst-sys
call AUTO-SETUP-SYSTEM.bat
cd Setup-bat/install/minecraft-server-main
call Auto-startup.bat

endlocal
pause
exit /b 0