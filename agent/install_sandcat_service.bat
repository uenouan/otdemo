@echo off
setlocal

rem --- 管理者権限チェック ---
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 管理者権限が必要です。バッチファイルを右クリックして「管理者として実行」してください。
    pause
    exit /b
)

rem --- 変数定義 ---
set NSSM_PATH=C:\Users\Public\nssm.exe
set SANDCAT_EXE=C:\Users\Public\splunkd.exe
set SERVER=http://172.18.25.10:8888
set GROUP=red
set SERVICE_NAME=SandcatAgent

rem --- NSSM存在確認 ---
if not exist "%NSSM_PATH%" (
    echo nssm.exeが %NSSM_PATH% に存在しません。
    pause
    exit /b
)

rem --- 既存サービス削除（もし存在するなら） ---
sc query "%SERVICE_NAME%" >nul 2>&1
if %errorlevel% == 0 (
    sc stop "%SERVICE_NAME%"
    sc delete "%SERVICE_NAME%"
)

rem --- サービス作成 ---
"%NSSM_PATH%" install "%SERVICE_NAME%" "%SANDCAT_EXE%" -server %SERVER% -group %GROUP%

rem --- サービス詳細設定（自動起動、説明付与） ---
sc config "%SERVICE_NAME%" start= auto
sc description "%SERVICE_NAME%" "Sandcat agent service for Caldera connection."

rem --- サービス起動 ---
sc start "%SERVICE_NAME%"

echo.
echo [完了] Sandcatサービスが登録され、起動されました。
pause
endlocal