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


@REM リポジトリダウンロード
    @echo off
    chcp 65001 > NUL
    setlocal enabledelayedexpansion
    title 自動ダウンロードシステム実行中...

    @REM set GITHUB_URL=https://github.com/akikukeo/minecraft-server/archive/refs/heads/main.zip

    set GITHUB_URL=https://github.com/akikukeo/minecraft-server/archive/refs/tags/v0.2.5-alpha.tar.gz

    set ZIP_FILE=.\server-v0.2.5-alpha.tar.gz
    set EXTRACT_DIR=.\server-v0.2.5-alpha.tar.gz

        md install
        cd install
        
    @REM curlを使ってリポジトリをダウンロード
        echo Downloading repository...
        curl -L -o %ZIP_FILE% %GITHUB_URL%

    @REM ダウンロードが成功したかを確認

        if not exist %ZIP_FILE% (
            echo ダウンロードに失敗しました。処理を終了します。
            pause
            exit /b 1
        )  else (
                echo ダウンロードが完了しました。
        )

    @REM tarを使ってZIPファイルを解凍

        echo tarを展開しています...これには数分から数十分かかります...
        tar -xf %ZIP_FILE%

    @REM 展開が成功したかを確認
        if not exist %EXTRACT_DIR% (
            echo 展開に失敗しました。処理を終了します。
            cd
            pause
            exit /b 1
        )

    @REM ダウンロードしたZIPファイルを削除
        echo tarを削除しています...
        del %ZIP_FILE%

    echo すべての工程が完了しました。
    endlocal
    pause
    exit 