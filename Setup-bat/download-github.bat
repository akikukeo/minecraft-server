@echo off
setlocal enabledelayedexpansion
title �����_�E�����[�h�V�X�e�����s��...

@REM config.ini ��ǂݍ���
    @REM config.ini ��ǂݍ���
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
        set %%a=%%b
    )

cd install

@REM curl���g���ă��|�W�g�����_�E�����[�h
    echo Downloading repository...
    curl -L -o !ZIP_FILE! !GITHUB_URL!

@REM �_�E�����[�h���������������m�F
    if not exist !ZIP_FILE! (
        echo !ERROR_R! �_�E�����[�h�Ɏ��s���܂����B�������I�����܂��B
        exit /b 1
    )  else (
            echo !LOG_R! �_�E�����[�h���������܂����B
    )

@REM tar���g����ZIP�t�@�C������
    echo !LOG_R! ZIP��W�J���Ă��܂�...
    tar -xf !ZIP_FILE!

@REM �𓀂��������������m�F
    if not exist !EXTRACT_DIR! (
        echo !LOG_R! �W�J�Ɏ��s���܂����B�������I�����܂��B
        exit /b 1
    )

@REM �_�E�����[�h����ZIP�t�@�C�����폜
    echo !LOG_R! ZIP���폜���Ă��܂�...
    del !ZIP_FILE!

echo !LOG_R! ���ׂẴ_�E�����[�h���������܂����B
endlocal
exit /b 0