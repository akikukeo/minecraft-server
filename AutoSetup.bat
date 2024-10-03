@REM pytyon埋め込み版の構成
    chcp 65001 > NUL
    @echo off
    @REM https://github.com/Zuntan03/EasyBertVits2 より引用・改変
    setlocal enabledelayedexpansion

    
    set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass
    set CURL_CMD=C:\Windows\System32\curl.exe

    if not exist %CURL_CMD% (
        echo [ERROR] %CURL_CMD% が見つかりません。
        pause & exit /b 1
    )

    if "%1" neq "" (
        set PYTHON_DIR=%~dp0%~1
    ) else (
        set PYTHON_DIR=%~dp0python
    )
    set PYTHON_CMD=%PYTHON_DIR%\python.exe

    if "%2" neq "" (
        set VENV_DIR=%~dp0%~2
    ) else (
        set VENV_DIR=%~dp0venv
    )

    echo --------------------------------------------------
    echo PS_CMD: %PS_CMD%
    echo CURL_CMD: %CURL_CMD%
    echo PYTHON_CMD: %PYTHON_CMD%
    echo PYTHON_DIR: %PYTHON_DIR%
    echo VENV_DIR: %VENV_DIR%
    echo --------------------------------------------------
    echo.

    if not exist "%PYTHON_DIR%"\ (
        echo --------------------------------------------------
        echo Downloading Python...
        echo --------------------------------------------------
        echo Executing: %CURL_CMD% -o python.zip https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip
        %CURL_CMD% -o python.zip https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip
        if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

        echo --------------------------------------------------
        echo Extracting zip...
        echo --------------------------------------------------
        echo Executing: %PS_CMD% Expand-Archive -Path python.zip -DestinationPath \"%PYTHON_DIR%\"
        %PS_CMD% Expand-Archive -Path python.zip -DestinationPath \"%PYTHON_DIR%\"
        if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

        echo --------------------------------------------------
        echo Removing python.zip...
        echo --------------------------------------------------
        echo Executing: del python.zip
        del python.zip
        if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

        echo --------------------------------------------------
        echo Enabling 'site' module in the embedded Python environment...
        echo --------------------------------------------------
        echo Executing: %PS_CMD% "&{(Get-Content '%PYTHON_DIR%/python310._pth') -creplace '#import site', 'import site' | Set-Content '%PYTHON_DIR%/python310._pth' }"
        %PS_CMD% "&{(Get-Content '%PYTHON_DIR%/python310._pth') -creplace '#import site', 'import site' | Set-Content '%PYTHON_DIR%/python310._pth' }"
        if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

        echo --------------------------------------------------
        echo Downloading get-pip.py...
        echo --------------------------------------------------
        echo Executing: %CURL_CMD% -o "%PYTHON_DIR%\get-pip.py" https://bootstrap.pypa.io/get-pip.py
        %CURL_CMD% -o "%PYTHON_DIR%\get-pip.py" https://bootstrap.pypa.io/get-pip.py
        if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

        echo --------------------------------------------------
        echo Installing pip...
        echo --------------------------------------------------
        echo Executing: "%PYTHON_CMD%" "%PYTHON_DIR%\get-pip.py" --no-warn-script-location
        "%PYTHON_CMD%" "%PYTHON_DIR%\get-pip.py" --no-warn-script-location
        if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

        echo --------------------------------------------------
        echo Installing virtualenv...
        echo --------------------------------------------------
        echo Executing: "%PYTHON_CMD%" -m pip install virtualenv --no-warn-script-location
        "%PYTHON_CMD%" -m pip install virtualenv --no-warn-script-location
        if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )
    )

    if not exist %VENV_DIR%\ (
        echo --------------------------------------------------
        echo Creating virtual environment...
        echo --------------------------------------------------
        echo Executing: "%PYTHON_CMD%" -m virtualenv --copies "%VENV_DIR%"
        "%PYTHON_CMD%" -m virtualenv --copies "%VENV_DIR%"
        if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )
    )

    echo --------------------------------------------------
    echo Completed.
    echo --------------------------------------------------

endlocal

@REM リポジトリダウンロード
    @echo off
    chcp 65001 > NUL
    setlocal enabledelayedexpansion
    title 自動ダウンロードシステム実行中...

    set GITHUB_URL=https://github.com/akikukeo/minecraft-server/archive/refs/heads/main.zip
    set ZIP_FILE=.\minecraft-server-main.zip
    set EXTRACT_DIR=.\minecraft-inst-sys

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
        echo ZIPを展開しています...
        tar -xf %ZIP_FILE%

    @REM 展開が成功したかを確認
        if not exist %EXTRACT_DIR% (
            echo 展開に失敗しました。処理を終了します。
            pause
            exit /b 1
        )

    @REM ダウンロードしたZIPファイルを削除
        echo ZIPを削除しています...
        del %ZIP_FILE%

    echo すべてのダウンロードが完了しました。
    endlocal
    pause
    exit 