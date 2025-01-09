@echo off

:: Define variables
set "game_path=C:\Program Files (x86)\Steam\steamapps\common\Path of Exile 2\PathOfExileSteam.exe"
set "affinity_value=0xFFF0"

:: Start the game
echo Starting Path of Exile...
start /b "" "%game_path%"

:: Wait for the process to start
:wait_for_process
powershell -Command "if (!(Get-Process -Name 'PathOfExileSteam' -ErrorAction SilentlyContinue)) { Start-Sleep -Seconds 1; exit 1 }"
if errorlevel 1 goto wait_for_process

:: Set CPU affinity
echo Setting CPU affinity to %affinity_value%...
powershell -Command "& { (Get-Process -Name 'PathOfExileSteam').ProcessorAffinity = %affinity_value% }"

:: Exit script
exit
