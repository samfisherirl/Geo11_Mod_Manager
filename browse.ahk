LogGames := A_AppDataCommon "\GameslistGeo11\Gamename.txt" 
BROWSE_One()
    {
        FileSelectFile, Selectgame, 32, , Select a game, Application (*.exe)
        if (Selectgame = "")
            MsgBox, You didn't select anything.
        else
        {

            SplitPath, Selectgame, Gameexe, Gamepath, Gameextenstion, Gamenameonly

            if !FileExist(LogGames)
            {
                FileAppend,%Selectgame%,%LogGames%
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
                        GameError := 0
                        FileAppend, %Gameexe%, %GamesUpdate%
                    }
                }
                ;Gui Add, ComboBox, vcbx w200 vVersChoice, x32||x64
            }
        }
        Nextup: ;Gui Add, ComboBox, vcbx w200 vVersChoice, x32||x64
            GuiControlGet,BinaryInstall,, Install       ; pass on a file, replace the word "key" with "lock" in file_copy.txt


        Return Gameexe
        }

LoadGames()
{
    LogGames := A_AppDataCommon "\GameslistGeo11\Gamename.txt" 
			msgbox, 1
Loop, Read, %LogGames%
{
			msgbox, 2
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
<option value="%Stored%"> %Stored% </option>
) 
			msgbox, %Stringer%
        }
		else
			Stored := Cell[2]
            Stringer= 
			(
%Stringer%
<option value="%Stored%"> %Stringer% </option>  
				)
			msgbox, %Stringer%
    }
}
return Stringer
}


HelixFunc()
    {
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