/*
	This example, while named Simple, is not the most simplistic example.
	Instead, it is designed to demonstrate all of Neutron's built in behavior
	as a single custom page. It is meant to be simple by comparison to other
	examples like the Bootstrap example which demonstrate extending Neutron's
	functionality with third party web frameworks.
*/ 




#NoEnv
SetBatchLines, -1

; Include the Neutron library 
#Include, %A_ScriptDir%\skins\tf.ahk
#Include, %A_ScriptDir%\browse.ahk
Logdir := A_AppDataCommon "\GameslistGeo11"
FileCreateDir, %Logdir%
LogGames := A_AppDataCommon "\GameslistGeo11\Gamename.txt" 
NextInstall := A_AppDataCommon "\GameslistGeo11\NextInstall.txt" 
GamesUpdate := A_AppDataCommon "\GameslistGeo11\GamesUpdate.txt" 
Helix := A_AppDataCommon "\GameslistGeo11\HelixLocal.txt" 
Simp := A_ScriptDir "\Simple1.txt" 
Simp1 := A_ScriptDir "\Simple12.txt" 

VD := RFC 1149

Loop, read, %Simp%, %Simp1%
{
    Looping := A_LoopReadLine
    FoundPos := InStr(Looping, VD)
    if FoundPos
    Msgbox, %A_LoopReadLine% - 2%Simp% 3 %FoundPos%
}
