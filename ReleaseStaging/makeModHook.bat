@echo off
SETLOCAL enableDelayeExpansion

::get relevant config vars
for /f "tokens=1,2 delims==" %%g in (config.ini) do (
	if %%g==cookedModsPath set cookedModsPath=%%h
)

::make the Uplugin
copy nul samsModHook.uplugin
(
echo {
echo 	"FileVersion": 3,
echo 	"VersionName": " V1",
echo 	"FriendlyName": "samsModHook",
echo 	"Description": "a hook in order to spawn the mod \"Sams Mod Core\"",
echo 	"Category": "UGC - Cosmetic",
echo 	"CreatedBy": "Samamstar",
echo 	"CreatedByURL": ""
echo }
) > samsModHook.uplugin

::package mod042 for the hook
rmdir packagerInput /s /q
mkdir packagerInput\Content\_ModBPs\
copy "%cookedModsPath%\Content\_ModBPs\Mod042.*" "packagerInput\Content\_ModBPs\"
call packageInput

::move the files into the local Mods folder
mkdir Mods\samsMods\Content\Paks
move samsModHook.uplugin Mods\samsMods\
ren packagerOutput\new_P.pak samsModHook_P.pak
move packagerOutput\samsModHook_P.pak Mods\samsMods\Content\Paks\

if not "%1"=="noPause" (
	pause
)
