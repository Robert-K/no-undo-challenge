#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#Singleinstance, Force
#Persistent

extensions := "mp3,wav,ogg"
filenames := Object()
Loop Sounds\* {
	if A_LoopFileExt in %extensions%
		filenames.Insert(A_LoopFileFullPath)
}

OutputDebug, % filenames.MaxIndex()

IniRead, key, hotkey.ini, Settings, hotkey, ^z

Hotkey,%key%, press

return

press:
Random,i,1,% filenames.MaxIndex()
SoundPlay, Sounds\Buzzer\buzzer.mp3
Sleep, 500
SoundPlay, % filenames[i]
return