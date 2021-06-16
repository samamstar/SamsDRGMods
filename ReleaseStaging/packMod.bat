@echo off
setlocal EnableDelayedExpansion

::Find variables in config.ini
for /f "tokens=1,2 delims==" %%g in (config.ini) do (
	if %%g==cookedModsPath set cookedModsPath=%%h
	if %%g==desiredModsFolder set desiredModsFolder=%%h
)

if "%~1" == "" (
	echo No Mod name specified
	pause
	goto end
)

set modName=%~1

rmdir packagerInput /S /Q
rmdir packagerOutput /S /Q
robocopy "%cookedModsPath%\content\_ModBPs\SamsMods\%modName%" "%cd%\packagerInput\content\_ModBPs\SamsMods\%modName%" /MIR /E /njh /njs /ndl /nc /ns /nfl
call packageInput.bat noPause

echo renaming pak
ren "%cd%\packagerOutput\new_P.pak" "%modName%_P.pak"

echo moving pak
if not exist "%cd%\Paks\%desiredModsFolder%" mkdir "%cd%\Paks\%desiredModsFolder%"
move "%cd%\packagerOutput\%modName%_P.pak" "%cd%\Paks\%desiredModsFolder%"

::There's probably a better way to pass an argument to disable pausing, but Oh well
if not "%2"=="noPause" (
	pause
)

:end