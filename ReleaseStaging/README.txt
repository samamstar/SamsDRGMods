This folder contains several bat files with a config to use them

config.INI: contains several key/value pairs for the bats to access. no spaces in the keys, and no quotes around the values(spaces ok tho). Does not support sections so it's not technically a *true* INI but it's good enough for me
Also, folders end with no \ the .bats expect that

	UEPackerPath: the path towards UnealPak.exe inside the Unreal Engine folders
	drgPath: the path for the Primary DRG folder (Deep Rock Galactic) ; now that I think about it this should really be drgDirectory, but oh well
	cookedModsPath: where the Uproject sends the content file when cooking
	rawModsPath: where to find the Content folder before cooking.
	desiredModsFolder: Where to put all of the .pak files. Leave emptry to put straight into paks\

packageInput.bat %1 : creates a .pak file from what's placed into packagerInput. Packs to packagerOutput\new_P.pak
	%1: put noPause here to stop the bat from pausing at the end
		; Argument not required, will run just fine without an argument


packMod.bat %1 %2 : creates and names a pak file based on %1, renames it, and places it in %cd%\desiredModsFolder
	%1: the folder name of the mod.
		;has to be the name of the folder in the _ModBPs\SamsMods\ folder
	%2: put noPause here to stop the bat from pausing at the end
	
MakeModHook.bat %1 : creates and names a pak file to spawn Core and places it in %cd&\desiredModsFolder
	%1: put noPause here to stop the bat from pausing at the end
	
QuickTestAllMods.bat : Packages all the mods in SamsMods\ and moves them into the DRG paks folder. 