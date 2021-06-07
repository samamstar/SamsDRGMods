This folder contains several bat files with a config to use them

config.INI: contains several key/value pairs for the bats to access. no spaces in the keys, and no quotes around the values(spaces ok tho). Does not support sections so it's not technically a *true* INI but it's good enough for me
	UEPackerPath: the path towards UnealPak.exe inside the Unreal Engine folders
	drgPath: the path for the Primary DRG folder (Deep Rock Galactic) ; now that I think about it this should really be drgDirectory, but oh well
	cookedModsPath: where the Uproject sends the content file when cooking
	rawModsPath: where to find the Content folder before cooking.

packageInput.bat %1 : creates a .pak file from what's placed into packagerInput. Packs to packagerOutput\new_P.pak
	%1: put noPause here to stop the bat from pausing at the end
		; Argument not required, will run just fine without an argument

