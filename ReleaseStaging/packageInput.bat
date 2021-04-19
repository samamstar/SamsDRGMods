@echo off
setlocal EnableDelayedExpansion

::Find variables in config.ini
for /f "tokens=1,2 delims==" %%g in (config.ini) do (
	if %%g==UEPackerPath set UEPackerPath=%%h
)

::So that stagingDir gets passed to UEPacker. Pretty sure if I disabled delayed expansion this wouldn't be necassary, but I prefer using delayedExpansion on all my batch scripts
set stagingDir=%cd%

::Create a text file to use for UEPacker to find input
copy nul temp.txt
echo "%stagingDir%\packagerInput\" "..\..\..\FSD\">temp.txt

::Execute the UEPacker to compress the contents of the packagerInput folder
echo executing UEPacker
"%UEPackerPath%" "%stagingDir%\packagerOutput\new_P.pak" -Create="%stagingDir%\temp.txt" -compress
del temp.txt

echo input packaged successfully

::There's probably a better way to pass an argument to disable pausing, but Oh well
if not "%1"=="noPause" (
	pause
)