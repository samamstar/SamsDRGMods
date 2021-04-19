@echo off
setlocal EnableDelayedExpansion

if not "%~n1"=="modInfo" (
	echo modInfo not found, please drag/add as an argument a valid modInfo.ini
	echo 
	pause
	goto eof
)

for /f "tokens=1,2 delims==" %%g in (%~1) do (
	set %%g=%%h
)

copy nul temp.txt
(
echo {
echo 	"FileVersion": 3,
echo 	"VersionName": " %modVersion%",
echo 	"FriendlyName": "%modName%",
echo 	"Description": "%modDescription%",
echo 	"Category": "%modCategory%",
echo 	"CreatedBy": "%modCreatedBy%",
echo 	"CreatedByURL": "%modCreatedByURL%"
echo }
) > temp.txt
ren temp.txt "%modName%.uplugin"
echo created "%modName%.uplugin" successfully

if not "%2"=="noPause" (
	pause
)

:eof
