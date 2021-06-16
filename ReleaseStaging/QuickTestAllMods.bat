@echo off
setlocal EnableDelayedExpansion

::Find variables in config.ini
for /f "tokens=1,2 delims==" %%g in (config.ini) do (
	if %%g==cookedModsPath set cookedModsPath=%%h
	if %%g==desiredModsFolder set desiredModsFolder=%%h
	if %%g==drgPath set drgPath=%%h
)

rmdir "%cd%\Paks" /S /Q

for /D %%g in (%cookedModsPath%\content\_ModBPs\SamsMods\*) do (
	echo packing %%g
	call packMod.bat "%%~ng" noPause
	echo %%g packing success
)

call makeModHook.bat

echo moving to DRG directory
robocopy "%cd%\Paks" "%drgPath%\FSD\Content\Paks" /MOVE /E /njh /njs /ndl /nc /ns /nfl /it /is
echo done!

pause