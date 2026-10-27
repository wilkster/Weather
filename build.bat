@echo off
set "WAS_RUNNING=0"
taskkill /f /im WeatherWidget.exe >nul 2>&1
if not errorlevel 1 set "WAS_RUNNING=1"
timeout /t 1 /nobreak >nul

start /wait "" C:\Apps\AHK\V2\Ahk2Exe.exe /in "WeatherWidget.ahk2" /icon "Partly Cloudy.ico" /base "C:\Apps\AHK\V2\AutoHotkey64.exe" /out "WeatherWidget.exe"

if "%WAS_RUNNING%"=="1" start "" "WeatherWidget.exe"