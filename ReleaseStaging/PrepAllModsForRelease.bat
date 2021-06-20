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

echo setting up modPack
rmdir "%cd%\modPack" /S /Q
mkdir modPack
robocopy "%cd%\Paks" "%cd%\modPack\Paks" /MOVE /E /njh /njs /ndl /nc /ns /nfl /it /is
copy "%cd%\InstallationInstructions_TEMPLATE.txt" "%cd%\modPack"
ren "%cd%\modPack\InstallationInstructions_TEMPLATE.txt" InstallationInstructions.txt
echo done!

echo zipping up modPack
tar --create --auto-compress -f "%cd%\modPack.zip" "modPack"
echo done!

pause