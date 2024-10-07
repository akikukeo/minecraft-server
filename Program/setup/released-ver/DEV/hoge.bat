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

cd ..\install\

(
echo %PS_CMD% Expand-Archive -Path %FILE% -DestinationPath %FILE_N%
) > extract.bat


call extract.bat

endlocal
pause
exit /b 0