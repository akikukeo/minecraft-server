@echo off
setlocal

::  カレントディレクトリを表示
echo Current directory: %CD%

::  curlを使ってリポジトリをダウンロード
echo Downloading repository...
curl -L -o %ZIP_FILE% %GITHUB_URL%

::  ダウンロードが成功したかを確認
if not exist %ZIP_FILE% (
    echo Download failed. Exiting.
    pause
    exit /b 1
)

::  tarを使ってZIPファイルを解凍
echo Extracting ZIP file...
tar -xf %ZIP_FILE%

::  解凍が成功したかを確認
if not exist %EXTRACT_DIR% (
    echo Extraction failed. Exiting.
    pause
    exit /b 1
)

::  ダウンロードしたZIPファイルを削除
echo Cleaning up...
del %ZIP_FILE%

echo Done.
pause
endlocal
exit /b 0