@REM いつもの
echo off 
chcp 65001 > NUL
setlocal enabledelayedexpansion
pushd "%~dp0"
    
@REM =============================================
set CURL_S=.\curl-8.10.1_3-win64-mingw\curl-8.10.1_3-win64-mingw\bin
set CURL_ZIP=curl-8.10.1_3-win64-mingw.zip
set CURL_EX_F=curl-8.10.1_3-win64-mingw
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass
set GITHUB_URL=https://github.com/akikukeo/minecraft-server/archive/refs/tags/v0.2.6-alpha.1.zip
set FILE=.\server-v0.2.6-alpha.1.zip
set FILE_N=server-v0.2.6-alpha.1
set EXTRACT_DIR=.\server-v0.2.6-alpha.1.zip

@REM tarを使用してZIPを展開する。curl用

goto curl_again

:curl_again
if not exist %CURL_EX_F% (
    echo curlが存在しません。展開作業を開始します...
    echo.
    echo -----------------------------------------
    echo %CURL_ZIP%を展開しています...これには数分かかる場合があります...
    echo -----------------------------------------
    echo.
    %PS_CMD% Expand-Archive -Path %CURL_ZIP%
    if not exist "%CURL_EX_F%" (
        echo.
        echo -----------------------------------------
        echo %CURL_ZIP%の展開に失敗しました。処理を終了します。
        
        echo -----------------------------------------
        echo.
        pause
        exit /b 1
    ) else (
        echo curlの展開が完了しました！
        goto curl_again
    )
    pause
) else (
    echo curlの存在を確認しました！利用します。
)

popd

@REM CURLを絶対パスで取得

pushd "%~dp0"
cd %CURL_S%
for /f "usebackq delims=" %%A in (`dir /b /s /a-d .^| findstr .exe`) do set CURL_CMD=%%A
echo %CURL_CMD%
popd
@REM =============================================

@REM ビット数と実行可能かを測定する。^(curlとtarの都合上^)
if "%PROCESSOR_ARCHITECTURE%" equ "x86" (
    echo.
    echo -----------------------------------------
    echo この端末の OS のビット数は "32bit" です。
    echo 32bitには対応していません。
    echo 処理を終了します。
    echo -----------------------------------------
    pause
    exit /b 1
) else (
    echo.
    echo -----------------------------------------
    echo この端末の OS のビット数は "64bit" です。

    echo 対応しているため、処理を続行します...
    echo -----------------------------------------
    echo.
)

%CURL_CMD% --version
echo.
echo -----------------------------------------

echo errorlevel==!errorlevel!

if "!errorlevel!"=="0" (
    echo 正常にcurlの読み込みが完了しました!
    echo -----------------------------------------
    echo.
    
) else (
    echo curlの読み込みに失敗しました...
    echo 処理を終了します。
    echo -----------------------------------------
    echo.
    pause
    exit /b 1

)

echo 一時的に同封curlを使用します。

echo パスは通しません。
        
popd

@REM リポジトリダウンロード

pushd "%~dp0"

title 自動ダウンロードシステム実行中...
@REM installディレクトリが既に存在するか確認
if not exist install (
    md install
    cd install
    goto warpmain

) else (
    echo.
    echo -----------------------------------------
    echo installはすでに存在します！
    echo -----------------------------------------
    echo.
    pause
    exit /b 1
)

:warpmain
@REM curlを使ってリポジトリをダウンロード

echo 該当ファイルダウンロード...

%CURL_CMD% -L -o %FILE% %GITHUB_URL%
@REM ダウンロードが成功したかを確認

if not exist %FILE% (
    echo.
    echo -----------------------------------------
    echo ダウンロードに失敗しました。処理を終了します。
    echo -----------------------------------------
    echo.
    popd
    pause
    exit /b 1

)  else (
    echo.
    echo -----------------------------------------
    echo ダウンロードが完了しました。
    echo -----------------------------------------
    echo.
)

@REM tarを使ってZIPファイルを解凍

@REM installディレクトリが既に存在するか確認
if not exist %FILE_N% (
) else (
    echo.
    echo -----------------------------------------
    echo %FILE_N%はすでに存在します！
    echo -----------------------------------------
    echo.
    pause
    exit /b 1
)

echo.
echo -----------------------------------------
echo %FILE%を展開しています...これには数分から数十分かかります...
echo -----------------------------------------
echo.

(
echo %PS_CMD% Expand-Archive -Path %FILE%
) > extract.bat

call extract.bat

endlocal
pause
exit /b 0