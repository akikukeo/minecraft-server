@echo off
setlocal
cd Setup-bat

call set.bat
:: test echo

set test=aaa
echo %test%
echo %GITHUB_URL%
pause