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
ProcessExist(Name){
    Process,Exist,%Name%
    return Errorlevel
}

FSRemove(StoredGet)
{
    Global
    LogGames := A_AppDataCommon "\GameslistGeo11\Gamename.txt" 
    loopstore:=""
    Loop, Read, %LogGames%
    { 
        word_array := StrSplit(A_LoopReadLine, delimiter) 
        string:=word_array[1]
        if (string="")
            continue
        if instr(string,StoredGet)
        {
            removethis:=string
            continue
        }
        if (loopstore="")
        {
            loopstore= 
(
%A_LoopReadLine% 
)
        }
        else
        {
            loopstore= 
            (
%A_LoopReadLine% 

%loopstore%
            )
        }
    } 
    Templog:= A_ScriptDir "\loggame.txt"
    Filedelete, %Templog% 
    Fileappend, %loopstore%, %Templog% 
    Filemove, %Templog%, %LogGames%, 1
    Filedelete, %GamesUpdate% 
    Fileappend, %loopstore%, %GamesUpdate% 
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

GuiWarning()
{
    displayer=
    (
Your folder should look`n
like this. If it does not,`n
    this will not function right.`n
It requires both D3D11 files `n
and ShaderFixes. `n
    )

    Gui Add, Picture, x168 y-16 w298 h248, %A_ScriptDir%\lib\picture for gui.PNG
    Gui Add, Text, x8 y0 w120 h110 +0x200,%displayer%
    Gui Add, Button, gClose x32 y160 w80 h23, Close

    Gui Show, w379 h226, Window
    Return

    Close:
    GuiEscape:
    GuiClose:
    ExitApp
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
HelixDoer(HelixBatPath,HelixPath,Selectgame,HelixLocal)
{
    global
    filedelete, %HelixBatPath%
    Fileappend, 
    (
@echo off
start "" "%HelixPath%" --game-path "%Selectgame%" --launch-type DX11Exe
rem 
rem 
rem 
echo: 
echo: 
echo: 
echo: Loading Katanga and Moving Mountains
echo: 
rem 
rem 
rem 
timeout /t 10
rem 
rem 
rem 
        ), %HelixBatPath%
        Filedelete, %HelixLocal%
        FileAppend, %HelixPath%, %HelixLocal%
    }

    VRSCDo(HelixBatPath,HelixPath,Selectgame,HelixLocal)
    {
        filedelete, %HelixBatPath%
        Fileappend, 
        (
@echo off
start "" "%Logdir%\vr-screen-cap.exe"
rem 
rem 
rem 
echo: 
echo: 
echo: 
echo: Loading Artum's VR Screen Cap and Moving Mountains
echo: 
rem 
rem 
rem 
timeout /t 10
rem 
rem 
rem 
        ), %HelixBatPath%

    }

Class OTA {
    DeleteFiles(OutDir)
    {
        Batfiler:= OutDir "\1.bat"
        FileDelete, %Batfiler%
        FileAppend, 
        (
@Echo Off 
del /q /f %OutDir%\geo\*.dll
rmdir %OutDir%\ShaderCacheDM\
rmdir %OutDir%\ShaderCache\
rmdir %OutDir%\geo\
del /q /f %OutDir%\pregame*.bat
del /q /f %OutDir%\post*.bat
del /q /f %OutDir%\leaveingamedir.exe

Timeout /t 1
        ), %Batfiler%
        Run, %Batfiler%, %A_ScriptDir%, Min 
            }

}
/*

    CustomShaderFun(SomePath) 
    {
        global
        Loop, Read, %CustomShaderLog%
        {
            ShaderPather:=A_LoopReadLine
            Break
        }
        FileDelete, %CustomShaderLog%
        Loop, Files, %SomePath%\*.*, R  ;mayyyyyyyyyyyyyyyyyy not work
        {
            shaderlines=
        (
%A_LoopFileName%

)
        FileAppend, %shaderlines%, %CustomShaderLog%
        }
    }
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