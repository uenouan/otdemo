@echo off
setlocal

rem --- �Ǘ��Ҍ����`�F�b�N ---
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo �Ǘ��Ҍ������K�v�ł��B�o�b�`�t�@�C�����E�N���b�N���āu�Ǘ��҂Ƃ��Ď��s�v���Ă��������B
    pause
    exit /b
)

rem --- �ϐ���` ---
set NSSM_PATH=C:\Users\Public\nssm.exe
set SANDCAT_EXE=C:\Users\Public\splunkd.exe
set SERVER=http://172.18.25.10:8888
set GROUP=red
set SERVICE_NAME=SandcatAgent

rem --- NSSM���݊m�F ---
if not exist "%NSSM_PATH%" (
    echo nssm.exe�� %NSSM_PATH% �ɑ��݂��܂���B
    pause
    exit /b
)

rem --- �����T�[�r�X�폜�i�������݂���Ȃ�j ---
sc query "%SERVICE_NAME%" >nul 2>&1
if %errorlevel% == 0 (
    sc stop "%SERVICE_NAME%"
    sc delete "%SERVICE_NAME%"
)

rem --- �T�[�r�X�쐬 ---
"%NSSM_PATH%" install "%SERVICE_NAME%" "%SANDCAT_EXE%" -server %SERVER% -group %GROUP%

rem --- �T�[�r�X�ڍאݒ�i�����N���A�����t�^�j ---
sc config "%SERVICE_NAME%" start= auto
sc description "%SERVICE_NAME%" "Sandcat agent service for Caldera connection."

rem --- �T�[�r�X�N�� ---
sc start "%SERVICE_NAME%"

echo.
echo [����] Sandcat�T�[�r�X���o�^����A�N������܂����B
pause
endlocal