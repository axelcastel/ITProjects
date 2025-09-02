@echo off
setlocal

:: By double clicking it will wait 5 seconds to start doing anything
timeout /t 5 /nobreak >nul

:: This will kill the Teams task completely from Task Manager
taskkill /f /im Teams.exe >nul 2>&1

:: Go to folder and identify the folder
start "" explorer "%appdata%\Microsoft\Teams"

:: Another pause to efficient computer resources
timeout /t 3 /nobreak >nul

:: We are clearing the Teams cache only, not other folders
powershell -NoProfile -Command ^
    "try { Remove-Item -Path \"$env:APPDATA\Microsoft\Teams\*\" -Recurse -Force -ErrorAction Stop } catch {}"

:: A pause to start Teams and no force the system
timeout /t 2 /nobreak >nul

:: This will start Teams
start "" "%LocalAppData%\Microsoft\Teams\Update.exe" --processStart "Teams.exe"

endlocal
exit /b
