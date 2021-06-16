@echo off
setlocal EnableDelayedExpansion

::Find variables in config.ini
for /f "tokens=1,2 delims==" %%g in (config.ini) do (
	if %%g==cookedModsPath set cookedModsPath=%%h
	if %%g==desiredModsFolder set desiredModsFolder=%%h
)

rmdir packagerInput /S /Q
rmdir packagerOutput /S /Q
mkdir "%cd%\packagerInput\content\_ModBPs"
copy "%cookedModsPath%\content\_ModBPs\Mod042.*" "%cd%\packagerInput\content\_ModBPs\" 
copy "%cookedModsPath%\content\_ModBPs\ModUI_042.*" "%cd%\packagerInput\content\_ModBPs\"
call packageInput.bat noPause

echo renaming hook
ren "%cd%\packagerOutput\new_P.pak" "SpawnHook_P.pak"

echo moving pak
if not exist "%cd%\Paks\%desiredModsFolder%" mkdir "%cd%\Paks\%desiredModsFolder%"
move "%cd%\packagerOutput\SpawnHook_P.pak" "%cd%\Paks\%desiredModsFolder%"

::There's probably a better way to pass an argument to disable pausing, but Oh well
if not "%1"=="noPause" (
	pause
)

:end