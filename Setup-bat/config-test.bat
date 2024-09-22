@echo off
setlocal

:: 書き込む内容を設定
set GITHUB_URL=https://github.com/akikukeo/minecraft-server/archive/refs/heads/main.zip
set ZIP_FILE=.\minecraft-server.zip
set EXTRACT_DIR=.\minecraft-server-main

:: config.txt に書き込む
(
    echo GITHUB_URL=%GITHUB_URL%
    echo ZIP_FILE=%ZIP_FILE%
    echo EXTRACT_DIR=%EXTRACT_DIR%
) > config.ini

echo config.txt に設定を書き込みました。
endlocal
pause