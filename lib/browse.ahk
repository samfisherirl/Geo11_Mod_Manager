GetAddresses()
{

    LogGames := A_AppDataCommon "\GameslistGeo11\Gamename.txt" 
    NextInstall := A_AppDataCommon "\GameslistGeo11\NextInstall.txt" 
    GamesUpdate := A_AppDataCommon "\GameslistGeo11\GamesUpdate.csv" 
    HelixLauncherBat := "\GameslistGeo11\vrapplauncher.bat"
    HTMLFile := A_AppDataCommon "\GameslistGeo11\HTMLfile.txt" 
    HTMLFile1 := A_AppDataCommon "\GameslistGeo11\HTMLfile1.txt" 
    HelixLocal := A_AppDataCommon "\GameslistGeo11\HelixLocal.txt" 
    ColumnNr := [1]
    TF("!" . LogGames, CreateGlobalVar="T")
    TF("!" . HTMLFile, CreateGlobalVar="H")
    delimiter := "," 
    return
}

FSRemove(StoredGet)
{
    Global
    LogGames := A_AppDataCommon "\GameslistGeo11\Gamename.txt" 
    loopstore:=""
    Loop, Read, %LogGames%
    { 
        ; Parses a comma-separated string.

        ; Colors := "red,green,blue"

        LineNumber := A_Index
        ;Colors := "red,green,blue"
        Loop, parse, A_LoopReadLine, `,
        {
            if (A_Index=1)
            {
                If InStr(A_LoopField,StoredGet)
                {
                    remover=
(
%A_LoopField%
)
continue
                }

                If InStr(A_LoopField,"")
                    continue
                else
                { 
                    john:=1
                }
                if (john=1)
                {
                    loopstore= 
                    (
%A_LoopReadLine% 

%loopstore%

)

                }
            }
        }
    }

/* 

        word_array := StrSplit(A_LoopReadLine, delimiter) 
        string:=word_array[1]
        if instr(string,StoredGet)
            continue
        if (string="")
            continue
        else
        {
            loopstore= 
            (
%A_LoopReadLine% 

%loopstore%

)
        }
    } 
            */
    Templog:= A_ScriptDir "\loggame1.txt"
    Filedelete, %Templog% 
    Fileappend, %loopstore%, %Templog% 
    Filemove, %Templog%, %LogGames%, 1
    Filedelete, %Templog% 
    Fileappend, %remover%, %Templog% 
    Filedelete, %GamesUpdate% 
    Filemove, %Templog%, %GamesUpdate%, 1
        } 

    Readfile()
    {
        GamesUpdate := A_AppDataCommon "\GameslistGeo11\GamesUpdate.csv" 
        CSV_Load(GamesUpdate,"csv", ",")
        Cols:=CSV_TotalCols("csv") 
        Loop, % Cols
        {
            reader := CSV_ReadCell("csv",1,A_Index)
            totaller.= CSV_ReadCell("csv",1,A_Index) 
        } 
    }
    LoadInstalled(html)
    {
        global 
        delimiter:=","
        html:=""
        Logger:=[]
        Loop, read, %LogGames% 
        {
            word_array := StrSplit(A_LoopReadLine, delimiter) 
            string:=word_array[2] 
            if (string!="")
            {
                html=
                (
                <option value="%string%" id="myH2" name="game">%string%</option> 

                %html%
                )
                Gamesarray:=Logger[A_Index] 
            }
        }

        Filedelete, loggame.txt 
        FileAppend, %html%, loggame.txt 
        FileMove, loggame.txt, %HTMLFile%, 1 
        return html
    }

    LooperHtml(looper)
    {
        global
        line:=""
        Loop, Read, %HTMLFile% ; read file line by line
            if !instr(A_LoopReadLine,Gameexe)
        {
            line .= A_LoopReadLine 
        }
        FileAppend, %line%, %HTMLFile1% 
        FileMove, %HTMLFile1%, %HTMLFile%, 1

    }

    LoopGameFile()
    {
        Global
        CSV_Load(LogGames, "data")
        Rows:=CSV_TotalRows("data")
        Loop, % Rows
        {
            Row:=A_Index
            Rowdata:=CSV_ReadRow("data",Row) 
            If Instr(Rowdata,StoredGet)
                CSV_DeleteRow("data", Row)
        } 
    }
/*
BROWSE_One()
{

    GetAddresses()
    global LogGames
    global NextInstall
    global GamesUpdate
    global HTMLFile
    global ColumnNr
    global delimiter 
    FileSelectFile, Selectgame, 32, , Select a game, Application (*.exe)
    if (Selectgame = "")
        MsgBox, You didn't select anything.
    else
    {
        SplitPath, Selectgame, Gameexe, Gamepath, Gameextenstion, Gamenameonly
        if !FileExist(LogGames)
        {
            FileAppend,%Selectgame%,%LogGames%
            FileDelete, %GamesUpdate%
            CurrentGameString=
(
%Selectgame%,%Gameexe%,%Gamepath%
)
            FileAppend,%CurrentGameString%,%LogGames%
            GameError := 0
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
                    HTMLPretext=
                    (
                    %Selectgame%,%Gameexe%,Gamepath
                    )
                    GameError := 0
                    FileAppend, %Gameexe%, %GamesUpdate% 
                    FileAppend, %HTMLPretext%, %HTMLFile% 
                    Stringer=
                    (
<option value="%Gameexe%">%Gameexe%</option>`n
                    )
                }
            }
            ;Gui Add, ComboBox, vcbx w200 vVersChoice, x32||x64
        }
    }
    Nextup: ;Gui Add, ComboBox, vcbx w200 vVersChoice, x32||x64
        GuiControlGet,BinaryInstall,, Install ; pass on a file, replace the word "key" with "lock" in file_copy.txt

    Return Stringer
}

LoadGames()
{

    GetAddresses()
    global LogGames
    global NextInstall
    global GamesUpdate
    global HTMLFile
    global ColumnNr
    global delimiter 
    msgbox, 1
    Stored := ""
    Loop, Read, %LogGames%
    {
        if (A_LoopReadLine="")
            continue
        else
        {
            Cell := StrSplit(A_LoopReadLine,delimiter)
            If (Stored="")
            {
                Stored := Cell[2]
                Stringer=
                (
                <option value="%Stored%">%Stored%</option>`n
                )
            }
            else
            {
                Stored := Cell[2]
                Stringer= 
                (
                %Stringer% 
                <option value="%Stored%">%Stored%</option> 
                )
                msgbox, %Stringer%
            }
        }
    }
    FileAppend, %Stringer%, %HTMLFile%
    return Stringer
}

Generater()
{ 

    GetAddresses()
    global LogGames
    global NextInstall
    global GamesUpdate
    global HTMLFile
    global ColumnNr
    global delimiter 
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
        FileCreateDir, %Gamepath%\originaldx
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
        If (BinaryInstall="Yes")
        {
            if (HelixPath != "")
            {
                msgbox, 4,, Is this the right path to Helix Katanga? `n%HelixPath%
                IfMsgBox No
                Goto, KatangaGo
                IfMsgBox Yes
                Goto, KatangaYes
            }
            KatangaGo:
                Msgbox, Select Path to Katanga
                FileSelectFile, HelixPath, 32, , Select Kantagna Path, Application (*.exe)
                if (Selectgame = "")
                    MsgBox, You didn't select anything.
            }
            KatangaYes:
                FileDelete, %Logfile% ; 
                If (BinaryInstall="Yes")
                {
                    FileAppend, 
                    (
                    %Selectgame%
                    %HelixPath%
                    ), %Logfile%
                    Filedelete, %Helix%
                    FileAppend, %HelixPath%, %Helix%
                }
                Else
                    FileAppend, %Selectgame%, %Logfile% 

                FileAppend, %TextforGamelog%, %LogGames%

                ShortcutMaker := A_Desktop "\" Gamenameonly " VR.lnk"
                AHKLocal := Gamepath "\leaveingamedir.exe" 
                FileCreateShortcut, %AHKLocal%, %ShortcutMaker%, %Gamepath%,,,%Localicon%
                Msgbox, Geo11 Shortcut sent to desktop. 

            }
            Else
                Msgbox, Select a game without Geo11 files 
        } 

        HelixFunc()
        {
            GetAddresses()
            global LogGames
            global NextInstall
            global GamesUpdate
            global HTMLFile
            global ColumnNr
            global delimiter 
            FileSelectFile, SelectHelix, 32, , Select a Helix, Application (*.exe)
            if (SelectHelix = "")
                MsgBox, You didn't select anything.
            else
            {

                SplitPath, SelectHelix, Helixexe, Helixpath, Helixextenstion, Helixnameonly

                if !FileExist(Helix)
                {
                    FileAppend,%Selecthelix%,%LogGames%
                    helixError := 0
                    Goto, Letsgo
                }
                Else
                {
                    Loop, read, %LogGames%
                    {
                        Currentline := A_LoopReadLine
                        If InStr(Currentline, Helixexe)
                        {
                            LineRead := StrSplit(Currentline,delimiter)
                            Helixname := LineRead[2]
                            Msgbox, Error. %Helixname% already has Geo11.
                            HelixError := 1
                            break
                        }
                        Else
                        {
                            HelixError := 0
                            FileAppend, %Helixexe%, %HelixUpdate%
                        }
                    }
                    ;Gui Add, ComboBox, vcbx w200 vVersChoice, x32||x64
                }
            }
            Letsgo: ;Gui Add, ComboBox, vcbx w200 vVersChoice, x32||x64
                GuiControlGet,BinaryInstall,, Install
            }