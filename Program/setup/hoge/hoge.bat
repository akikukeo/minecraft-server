@REM いつもの
    echo off 
    chcp 65001 > NUL
    setlocal enabledelayedexpansion
    pushd "%~dp0"

:question
    set /p anser="処理を実行しますか？ (Y/N)"

    if /i %anser%==y (
        
        echo syori
        
        echo 完了しました！
        echo.
    ) else if /i %anser%==n (
        echo 処理を中止します！
        echo.
    ) else (
        echo 入力が不正です。^(Y/N^)で入力をお願いします。
        echo.
        goto question
    )
pause