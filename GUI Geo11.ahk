; Generated by Auto-GUI 3.0.1
#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

#Include, %A_ScriptDir%\skins\tf.ahk
;https://github.com/hi5/TF#TF_ReplaceInLines
;https://github.com/hi5/TF#TF_ReplaceInLines

Logdir := A_AppDataCommon "\GameslistGeo11"
FileCreateDir, %Logdir%
LogGames := A_AppDataCommon "\GameslistGeo11\Gamename.txt" 
        GamesUpdate := A_AppDataCommon "\GameslistGeo11\GamesUpdate.txt" 
        FileReadLine, Fuk, GamesUpdate, 1

        SelectedGame := Fuk
ColumnNr := [1]
delimiter := ","
Loop, read, %LogGames%
{ 
    if (A_LoopReadLine="") 
        continue
    else
    {
        Cell := StrSplit(A_LoopReadLine,delimiter)
        If (Stored="")
            Stored := Cell[2] "||" Stored
        else
            Stored := Cell[2] "|" Stored
    }
}  
global GameError := 0
Imagine := A_ScriptDir "\ico\bg.jpg"
Gui, Add, Picture, x-8 y0 w610 h385 , % Imagine

Gui Font, s9, Segoe UI
Gui Add, DropDownList, vVersion x288 y72 w84, x64 game||x32 game
Gui Add, Text, x180 y10 w189 h61, Select Game Location and version,`n'Generate' will push the Geo11 files and a Geo11 desktop shortcut.
Gui Add, Button, gGenerate x288 y144 w87 h23, Generate
Gui Add, DropDownList, x288 y108 w84, Yes|| No
Gui Add, Button, gBrowse x184 y70 w90 h25, Browse
Gui Add, Button, gUninstall x288 y333 w84 h23, Uninstall
Gui Add, ListBox, vStoredforDisplay x176 y248 w102 h134, %Stored%
Gui Add, Button, gConfiger x288 y296 w84 h23, Config ini
Gui Add, Text, x288 y256 w101 h23, Current Installs 
        Gui Add, edit, x184 y144 w90 h21 vSelectedGameExe, % SelectedGame 
Gui Add, Text, x202 y109 w70 h23, Helix Vision?
Gui Add, CheckBox, x176 y192 w225 h20, Has Katanga/Helix Vision been located?
Gui Add, Text, x8 y8 w154 h278, This app will take the Geo11 files such as dxd11.dll and move to a "geo" folder in the game's directory. `n`nIt creates a desktop shortcut, when clicked, it will move the game's original "dxd11.dll" files to "/originaldx" and load geo11 dxd11 files. Creating a VR specific launcher/shortcut.`n`nOn game close, the files will return to original locations.`n`nThis is a 3rd party mod loader, I am not affiliated with the Geo11 team. Just a fan. 
        ;Gui Add, Edit, x184 y216 w85 h23, %SelectedGame% 
        Gui Show, w418 h394, Mod Manager for Geo11 
        Return

Browse:
    {
        FileSelectFile, Selectgame, 32, , Select a game, Application (*.exe)
        if (Selectgame = "")
            MsgBox, You didn't select anything.
        else
        {

            SplitPath, Selectgame, Gameexe, Gamepath, Gameextenstion, Gamenameonly

            if !FileExist(LogGames)
            {
                FileAppend,,%LogGames%
                GameError := 0
                msgbox, file doesnt exist
                Goto, Nextup
            }
            Else
            {
                Loop, read, %LogGames%
                { 
                    Currentline := A_LoopReadLine
                    If InStr(Currentline, Gameexe)
                    {
                        LineRead := StrSplit(Currentline,delimiter)
                        Gamename := LineRead[2]
                        Msgbox, Error. %Gamename% already has Geo11.
                        GameError := 1
                        break
                    }
                    Else
                    {
                        GameError := 0
                                    FileAppend, %Gameexe%, %GamesUpdate%

                    }
                }
                ;Gui Add, ComboBox, vcbx w200 vVersChoice, x32||x64 
            }
        } 
        Reload
        Nextup: ;Gui Add, ComboBox, vcbx w200 vVersChoice, x32||x64 

        }
        return

        Generate:
            {
                if (GameError=0)
                {
                    GuiControlGet,VersionRet,, Version
                    Msgbox, %VersionRet% Dlls for %Gameexe%
                        if (VersionRet="x64 game")
                    {
                        64or32 := "\Geo11FilesGoHere\x64\"
                    }
                    Else
                    {
                        64or32 := "\Geo11FilesGoHere\x32\"
                    }
                    DllLocal := A_ScriptDir 64or32
                    ChangeNames := DllLocal 
                    ;arraygeo := ["d3d11.geo", "d3dcompiler_47.geo", "d3dx.geo", "d3dxdm.geo", "nvapi64.geo"]
                    FileCreateDir, %Gamepath%\geo

                    ;arraygeo := ["d3d11.geo", "d3dcompiler_47.geo", "d3dx.geo", "d3dxdm.geo", "nvapi64.geo"]
                    arraydll := ["d3d11.dll", "d3dcompiler_47.dll", "d3dx.ini", "d3dxdm.ini", "nvapi64.dll"]

                    For index, value in arraydll
                    { 
                        geo := % arraydll[index] 
                        FileCopy, %DllLocal%\%geo%, %Gamepath%\geo\%geo%, 1
                    }
                    FileCopy, %A_ScriptDir%\leaveingamedir.exe, %Gamepath%\leaveingamedir.exe, 1
                    FileCopy, %A_ScriptDir%\pregame_move.bat, %Gamepath%\pregame_move.bat, 1
                    FileCopy, %A_ScriptDir%\postgame_move.bat, %Gamepath%\postgame_move.bat, 1
                    FileCopyDir, %DllLocal%\ShaderFixes, %Gamepath%\ShaderFixes, 1

                    Logfile := Gamepath "\Gamename.txt"
                    Random, rand, 1, 12
                    Localicon := A_ScriptDir "\ico\" rand ".ico" 
                    TextforGamelog := Selectgame "," Gameexe "`n"
                    FileDelete, %Logfile% ; 
                    FileAppend, %Selectgame%, %Logfile% 
                    FileAppend, %TextforGamelog%, %LogGames%
                    msgbox, %TextforGamelog%

                    ShortcutMaker := A_Desktop "\" Gamenameonly " VR.lnk"
                    AHKLocal := Gamepath "\leaveingamedir.exe" 
                    FileCreateShortcut, %AHKLocal%, %ShortcutMaker%, %Gamepath%,,,%Localicon%
                    Msgbox, Geo11 Shortcut sent to desktop.
                    Reload 
                }
                Else
                    Msgbox, Select a game without Geo11 files

            }
        return

        Configer:
            {
                GuiControlGet, StoredGet,,StoredforDisplay
                delimiter := ","
                Loop, read, %LogGames%, %GamesUpdate%
                { 
                    Currentline := A_LoopReadLine
                    If InStr(Currentline, StoredGet)
                    {
                        LineRead := StrSplit(Currentline,delimiter)
                        GameLocation := LineRead[1]
                        SplitPath, GameLocation, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
                        Run, %OutDir%\geo\d3dxdm.ini 
                    }
                    else 
                        Continue
                }
            }
        return

        Uninstall: 
            {
                GuiControlGet, StoredGet,,StoredforDisplay
                Msgbox, 4,, Uninstall Geo11 for %StoredGet%?
                IfMsgBox Yes
                {
                    delimiter := ","
                    Loop, read, %LogGames%, %GamesUpdate%
                    { 
                        Currentline := A_LoopReadLine
                        If InStr(Currentline, StoredGet)
                        {
                            LineRead := StrSplit(Currentline,delimiter)
                            GameLocation := LineRead[1]
                            SplitPath, GameLocation, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
                            Filedelete, %OutDir%\geo\*.dll
                            Filedelete, %OutDir%\geo\*.ini
                            Filedelete, %OutDir%\leaveingame*.exe
                            Filedelete, %OutDir%\VRLaun*.exe
                            ;FileAppend %A_LoopReadLine%`n
                            ;FileMove, %GamesUpdate%, %LogGames%, 1
                            LineNumber := A_Index
                            EndLine := LineNumber + 1
                        }
                        else 
                            Continue
                    }
                    LogTF := "!"LogGames
                    TF_ReplaceLine(LogTF,LineNumber,EndLine,"") 
                    Msgbox, Success
                    Reload
                    Goto, Beginning
                } 

                Else
                    Goto, Beginning

            }
        Beginning:
        return

        ;arraygeo := ["d3d11.geo", "d3dcompiler_47.geo", "d3dx.geo", "d3dxdm.geo", "nvapi64.geo"]
        arraydll := ["d3d11.dll", "d3dcompiler_47.dll", "d3dx.ini", "d3dxdm.ini", "nvapi64.dll"]
        FileCreateDir, %Gamepath%\geo

        For index, value in arraydll
        { 
            ;val := % value 
            ;geo := % arraygeo[index] 
            ;FileCopy, %DllLocal%\%val%, %DllLocal%\geo\, 1
            ;sleep, 15
            ;FileMove, %DllLocal%\geo\%val%, %DllLocal%\geo\%geo%, 1
            ;sleep, 10 
            dll := % arraydll[index] 
            FileCopy, %DllLocal%\%dll%, %Gamepath%\geo\, 1
        } 
        ;For index, value in arraygeo
        ;{ 
        ;    geo := % arraygeo[index] 
        ;    FileCopy, %DllLocal%\geo\%geo%, %Gamepath%, 1
        ;}
        ;FileCopy, %A_ScriptDir%\leaveingamedir.exe, %Gamepath%\leaveingamedir.exe, 1
        ;FileCopyDir, %DllLocal%\ShaderFixes, %Gamepath%\ShaderFixes, 1

        ;geo3d:
        ;    {
        ;        FileSelectFolder, OutputVar [, *StartingFolder, 2, Select where you will store], Selectgeo, 32, , Select D3Directory, File (*.dll); *.lnk
        ;        if (Selectgeo = "")
        ;            MsgBox, The user didn't select anything.
        ;        else
        ;        {
        ;            SplitPath, Selectgeo, Geoexe, Geopath, Geoextenstion, Geonameonly
        ;        }
        ;    }
        ;return
        ;
        ;generate:
        ;{
        ;        loglocal := "\Logfile.txt"
        ;        Logfile := A_AppDataCommon loglocal
        ;        }
        GuiEscape:
        GuiClose:
        ExitApp