@REM installディレクトリが既に存在するか確認

@REM いつもの
    echo off 
    chcp 65001 > NUL
    setlocal enabledelayedexpansion        

    @REM =============================================
            set CURL_S=.\curl-8.10.1_3-win64-mingw\curl-8.10.1_3-win64-mingw\bin
            set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass
            set GITHUB_URL=https://github.com/akikukeo/minecraft-server/archive/refs/tags/v0.2.6-alpha.1.zip
            set FILE=server-v0.2.6-alpha.1.zip
            set FILE_N=server-v0.2.6-alpha.1
            set EXTRACT_DIR=.\server-v0.2.6-alpha.1.zip
            @REM set CURL_CMD=C:\minecraft\minecraft-server\Program\setup\curl-8.10.1_3-win64-mingw\curl-8.10.1_3-win64-mingw\bin\curl.exe

        @REM     @REM CURLを絶対パスで取得
        @REM         cd %CURL_S%
        @REM         for /f "usebackq delims=" %%A in (`dir /b /s /a-d .^| findstr .exe`) do set CURL_CMD=%%A
        @REM         echo %CURL_CMD%
        @REM         popd
        @REM @REM =============================================

    @REM         if not exist %FILE_N% (
    @REM             cd install
    @REM             md %FILE_N%
    @REM             cd %FILE_N%

    @REM         ) else (
    @REM             echo.
    @REM             echo -----------------------------------------
    @REM             echo %FILE_N%はすでに存在します！
    @REM             echo -----------------------------------------
    @REM             echo.
    @REM             pause
    @REM             exit /b 1
    @REM         )

        echo.
        echo -----------------------------------------
        echo %FILE%を展開しています...これには数分から数十分かかります...
        echo -----------------------------------------
        echo.
        @REM tar -xf %FILE%
        %PS_CMD% Expand-Archive -Path server-v0.2.6-alpha.1.zip -DestinationPath server-v0.2.6-alpha.1
        pause