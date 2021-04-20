@echo off
SETLOCAL EnableDelayedExpansion

::get relevant config vars
for /f "tokens=1,2 delims==" %%g in (config.ini) do (
	if %%g==rawModsPath set rawModsPath=%%h
	if %%g==cookedModsPath set cookedModsPath=%%h
)

::test that the modInfo exists, so that things don't break
if "%1"=="" (
	echo please input a modInfo INI
	echo 
	pause
	goto eof
)

::Get the relevant modInfo for this script
for /f "tokens=1,2 delims==" %%g in (%1) do (
	if %%g==modName set modName=%%h
	if %%g==modLocation set modLocation=%%h
	if %%g==desiredModPath set desiredModPath=%%h
)

::Override desiredModPath if empty
if "desiredModPath"=="" (
	set desiredModPath=Mods\%modName%\
)

::make the proper folders
mkdir "Mods\%desiredModPath%\Content\Paks\"

::package the input
rmdir packagerInput /s /q
xcopy "%cookedModsPath%\%modLocation%" "packagerInput\%modLocation%" /e /y
call packageInput noPause

::move the package to the mod path
move packagerOutput\new_P.pak "Mods\%desiredModPath%\Content\Paks\"
ren "Mods\%desiredModPath%\Content\Paks\new_P.pak" "%modName%_P.pak"

::create and move the uplugin. 
call createUPlugin "%1" noPause
move "%modName%.uplugin" "Mods\%desiredModPath%"

if not "%2"=="noPause" (
	pause
)

:eof
