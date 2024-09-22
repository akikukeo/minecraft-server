@echo off
setlocal enabledelayedexpansion

cd Setup-bat

call set.bat
:: test echo

echo %GITHUB_URL%
endlocal
pause