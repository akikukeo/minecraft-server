@REM set oppython=false
@REM if "oppython"=="true" (
@REM     @REM pytyon埋め込み版の構成
@REM         chcp 65001 > NUL
@REM         @echo off
@REM         @REM https://github.com/Zuntan03/EasyBertVits2 より引用・改変
@REM         setlocal enabledelayedexpansion

        
@REM         set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass
@REM         set CURL_CMD=C:\Windows\System32\curl.exe

@REM         if not exist %CURL_CMD% (
@REM             echo [ERROR] %CURL_CMD% が見つかりません。
@REM             pause & exit /b 1
@REM         )

@REM         if "%1" neq "" (
@REM             set PYTHON_DIR=%~dp0%~1
@REM         ) else (
@REM             set PYTHON_DIR=%~dp0python
@REM         )
@REM         set PYTHON_CMD=%PYTHON_DIR%\python.exe

@REM         if "%2" neq "" (
@REM             set VENV_DIR=%~dp0%~2
@REM         ) else (
@REM             set VENV_DIR=%~dp0venv
@REM         )

@REM         echo --------------------------------------------------
@REM         echo PS_CMD: %PS_CMD%
@REM         echo CURL_CMD: %CURL_CMD%
@REM         echo PYTHON_CMD: %PYTHON_CMD%
@REM         echo PYTHON_DIR: %PYTHON_DIR%
@REM         echo VENV_DIR: %VENV_DIR%
@REM         echo --------------------------------------------------
@REM         echo.

@REM         if not exist "%PYTHON_DIR%"\ (
@REM             echo --------------------------------------------------
@REM             echo Downloading Python...
@REM             echo --------------------------------------------------
@REM             echo Executing: %CURL_CMD% -o python.zip https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip
@REM             %CURL_CMD% -o python.zip https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip
@REM             if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

@REM             echo --------------------------------------------------
@REM             echo Extracting zip...
@REM             echo --------------------------------------------------
@REM             echo Executing: %PS_CMD% Expand-Archive -Path python.zip -DestinationPath \"%PYTHON_DIR%\"
@REM             %PS_CMD% Expand-Archive -Path python.zip -DestinationPath \"%PYTHON_DIR%\"
@REM             if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

@REM             echo --------------------------------------------------
@REM             echo Removing python.zip...
@REM             echo --------------------------------------------------
@REM             echo Executing: del python.zip
@REM             del python.zip
@REM             if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

@REM             echo --------------------------------------------------
@REM             echo Enabling 'site' module in the embedded Python environment...
@REM             echo --------------------------------------------------
@REM             echo Executing: %PS_CMD% "&{(Get-Content '%PYTHON_DIR%/python310._pth') -creplace '#import site', 'import site' | Set-Content '%PYTHON_DIR%/python310._pth' }"
@REM             %PS_CMD% "&{(Get-Content '%PYTHON_DIR%/python310._pth') -creplace '#import site', 'import site' | Set-Content '%PYTHON_DIR%/python310._pth' }"
@REM             if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

@REM             echo --------------------------------------------------
@REM             echo Downloading get-pip.py...
@REM             echo --------------------------------------------------
@REM             echo Executing: %CURL_CMD% -o "%PYTHON_DIR%\get-pip.py" https://bootstrap.pypa.io/get-pip.py
@REM             %CURL_CMD% -o "%PYTHON_DIR%\get-pip.py" https://bootstrap.pypa.io/get-pip.py
@REM             if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

@REM             echo --------------------------------------------------
@REM             echo Installing pip...
@REM             echo --------------------------------------------------
@REM             echo Executing: "%PYTHON_CMD%" "%PYTHON_DIR%\get-pip.py" --no-warn-script-location
@REM             "%PYTHON_CMD%" "%PYTHON_DIR%\get-pip.py" --no-warn-script-location
@REM             if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

@REM             echo --------------------------------------------------
@REM             echo Installing virtualenv...
@REM             echo --------------------------------------------------
@REM             echo Executing: "%PYTHON_CMD%" -m pip install virtualenv --no-warn-script-location
@REM             "%PYTHON_CMD%" -m pip install virtualenv --no-warn-script-location
@REM             if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )
@REM         )

@REM         if not exist %VENV_DIR%\ (
@REM             echo --------------------------------------------------
@REM             echo Creating virtual environment...
@REM             echo --------------------------------------------------
@REM             echo Executing: "%PYTHON_CMD%" -m virtualenv --copies "%VENV_DIR%"
@REM             "%PYTHON_CMD%" -m virtualenv --copies "%VENV_DIR%"
@REM             if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )
@REM         )

@REM         echo --------------------------------------------------
@REM         echo Completed.
@REM         echo --------------------------------------------------

@REM     endlocal
@REM ) else (
@REM     pause
@REM     pythonはインストールされませんでした。(skip) 
@REM     endlocal
@REM )

@REM endlocal
@REM pause


@REM いつもの
    echo off 
    chcp 65001 > NUL
    setlocal enabledelayedexpansion
    pushd "%~dp0"
    
        @REM =============================================
            set CURL_S=.\curl-8.10.1_3-win64-mingw\curl-8.10.1_3-win64-mingw\bin
            set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass
            set GITHUB_URL=https://github.com/akikukeo/minecraft-server/archive/refs/tags/v0.2.6-alpha.1.zip
            set FILE=.\server-v0.2.6-alpha.1.zip
            set FILE_N=server-v0.2.6-alpha.1
            set EXTRACT_DIR=.\server-v0.2.6-alpha.1.zip
            @REM set CURL_CMD=C:\minecraft\minecraft-server\Program\setup\curl-8.10.1_3-win64-mingw\curl-8.10.1_3-win64-mingw\bin\curl.exe

            @REM CURLを絶対パスで取得
                cd %CURL_S%
                for /f "usebackq delims=" %%A in (`dir /b /s /a-d .^| findstr .exe`) do set CURL_CMD=%%A
                echo %CURL_CMD%
                popd
        @REM =============================================

@REM ビット数を測定する。^(curlの都合上^)
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
        echo -----------------------------------------
        echo.
    )
    @REM powershell -NoProfile -ExecutionPolicy Unrestricted .\hogehoge.ps1

@REM curlあるかチェック
    @REM curl.exeでバージョンを確認することによって正常に読み込めてるか確認する
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

            @REM echo 削除しますか？慎重に実行してください
            @REM echo install内のファイル,フォルダはすべて削除されます。この操作は取り消すことはできません。
            echo -----------------------------------------
            echo.
            @REM goto question
            
            pause
            exit /b 1
        )

@REM     :question
@REM     set /p anser="処理を実行しますか？ (Y/N)"

@REM     if /i %anser%==y (
@REM         goto deltedinstall_anser
@REM         :anser_afterdel
@REM         echo 削除しました！
@REM         echo.
@REM         goto warpmain
@REM     ) else if /i %anser%==n (
@REM         echo 処理を中止します！
@REM         echo.
@REM         popd
@REM         pause
@REM         exit /b 1
        
@REM     ) else (
@REM         echo 入力が不正です。^(Y/N^)で入力をお願いします。
@REM         echo.
@REM         goto question
@REM     )

@REM :deltedinstall_anser
@REM cd
@REM pause
@REM del install
@REM goto anser_afterdel
    
        
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
                md %FILE_N%
                cd %FILE_N%

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
        tar -xf %FILE%
        @REM %PS_CMD% Expand-Archive -Path %FILE% -DestinationPath %FILE_N%


    @REM 展開が成功したかを確認
        if not exist %EXTRACT_DIR% (
            echo.
            echo -----------------------------------------
            echo 展開に失敗しました。処理を終了します。
            echo -----------------------------------------
            echo.
            popd
            pause
            exit /b 1
        )

    @REM ダウンロードしたZIPファイルを削除
        echo.
        echo -----------------------------------------
        echo %FILE%を削除しています...
        echo -----------------------------------------
        echo.
        del %FILE%
            if "!errorlevel!"=="0"(
                echo 正常に削除が完了しました
            ) else (
                echo 削除に失敗しました...
                echo 処理を終了します。
                popd
                pause
                exit /b 1
            )

    popd
    endlocal
    exit /b 0