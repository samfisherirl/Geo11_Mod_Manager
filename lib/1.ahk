#NoEnv
SetWorkingDir, %A_ScriptDir%
SetBatchLines -1

;https://github.com/hi5/TF#TF_ReplaceInLines
;https://github.com/hi5/TF#TF_ReplaceInLines

global Zipfile := A_AppDataCommon "\GameslistGeo11\ziplocation.txt"
 
global HelixLocal := A_AppDataCommon "\GameslistGeo11\HelixLocal.txt" 
global UninstallLog := A_AppDataCommon "\GameslistGeo11\uninstall.txt" 
global CustomShaderLog := A_AppDataCommon "\GameslistGeo11\customshaderlog.txt" 
global Zipfile := A_AppDataCommon "\GameslistGeo11\ziplocation.txt"
global ZipExtract := A_AppDataCommon "\GameslistGeo11\zipextract.txt"

SomePath := A_ScriptDir "\Custom_Shaders"
FileRemoveDir, %SomePath%
FileCreateDir, %SomePath%

msgbox, pause
/*

    FileDelete, %ZipExtract%
    FileAppend, 
(
%A_ScriptDir%\CustomShaders
), %ZipExtract%
run, %A_ScriptDir%\dragdrop.exe, %A_ScriptDir%
Sleep, 2000

Loop, 30
{
    if ProcessExist("dragdrop.exe")
    Sleep 1000
    else 
    break
}


    delimiter = ","
SomePath := A_ScriptDir "\Custom Shaders"
FileRemoveDir, %SomePath%
FileCreateDir, Custom Shaders
Loop, read, %Zipfile%
{
    ZipGet := A_LoopReadLine
    break
}
msgbox, %ZipGet%
FileCopy, %ZipGet%, %SomePath%, 1
SplitPath, ZipGet, FilenameZip  
msgbox, %FilenameZip%
Sleep, 2000
;Filecopy, 1.7z, %A_ScriptDir%\CustomShaders\1.7z, 1
run, cmd.exe /k cd "%A_ScriptDir%\CustomShaders\",,, cmdPID
WinWait, ahk_pid %cmdPID%
;Send 7za.exe x %FilenameZip% {Enter} 
Send 7za.exe x %FilenameZip% -y {enter}
Loop, 1
{
	If WinExist("ahk_exe cmd.exe")
		ControlSend,, 7za.exe x %FilenameZip% -y{enter}, ahk_exe cmd.exe
	Sleep, 500
}
/*
Sleep, 2000
Loop, 2
{
	If WinExist("ahk_exe cmd.exe")
		ControlSend,, exit{Enter}, ahk_exe cmd.exe
	Sleep, 500
}