@echo off
setlocal
cd Setup-bat

call set.bat
:: test echo
echo %GITHUB_URL%
pause