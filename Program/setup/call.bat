@REM いつもの
    echo off 
    chcp 65001 > NUL
    setlocal enabledelayedexpansion

call AutoSetup-v0.2.6-alpha.2.bat
if "!errorlevel!"=="0"(
    
    echo すべての工程が完了しました。
) else (

    echo 失敗,異常終了を検知しました。
)

pause
endlocal
exit