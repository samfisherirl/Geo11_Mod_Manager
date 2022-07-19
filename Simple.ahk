﻿; Generated by Auto-GUI 3.0.1
#NoEnv
SetWorkingDir, %A_ScriptDir%
SetBatchLines -1

;https://github.com/hi5/TF#TF_ReplaceInLines
;https://github.com/hi5/TF#TF_ReplaceInLines

; Include the Neutron library
#Include %A_ScriptDir%\lib\Neutron.ahk
#Include %A_ScriptDir%\lib\tf.ahk 
#Include %A_ScriptDir%\lib\csv.ahk 
#Include %A_ScriptDir%\lib\browse.ahk   

HTMLFile := A_AppDataCommon "\GameslistGeo11\HTMLfile.txt" 
; Create a new NeutronWindow and navigate to our HTML page 
ColumnNr = [1]
delimiter = ","

LogGames := A_AppDataCommon "\GameslistGeo11\Gamename.txt" 
NextInstall := A_AppDataCommon "\GameslistGeo11\NextInstall.txt" 
GamesUpdate := A_AppDataCommon "\GameslistGeo11\GamesUpdate.txt" 
HelixLauncherBat := "\vrapplauncher.bat"
Logdir := A_AppDataCommon "\GameslistGeo11"
HelixLocal := A_AppDataCommon "\GameslistGeo11\HelixLocal.txt" 
FileCreateDir, %Logdir% 
/* 
Loop, read, %GamesUpdate%
{ 
    if (A_LoopReadLine="")
        continue
    else
    {
        CurrentGame := % A_LoopReadLine
    }
}
if FileExist(Helix)
{
    BinaryHelixFile := 1
    Loop, read, %Helix%
    {
        if (A_LoopReadLine="") 
            continue
        else
        {
            HelixPath := % A_LoopReadLine
        }
    } 
}
Else
    BinaryHelixFile := 0
If (HelixPath ="")
{
    BinaryHelixFile := 0
}
SelectedGame := CurrentGame
ColumnNr := [1]
delimiter := ","
*/ 

neutron := new NeutronWindow()
neutron.Load("Simple.html")

FileInstall, lib\bootstrap.min.css, lib\bootstrap.min.css
FileInstall, lib\bootstrap.min.js, lib\bootstrap.min.js
FileInstall, lib\jquery.min.js, lib\jquery.min.js  
FileInstall, Untitled-1.png, Untitled-1.png 
neutron.Gui("+LabelNeutron")

; Use the Gui method to set a custom label prefix for GUI events. This code is
; equivalent to the line `Gui, name:+LabelNeutron` for a normal GUI.

/* 
; Insert example 4 table 1 contents
Ex4_Table1 := [["Apple", 1], ["Orange", 2]]
html := ""
for row, data in Ex4_Table1
{
	html .= "<tr>"
	for col, cell in data
		html .= neutron.FormatHTML("<td>{}</td>", cell)
	html .= "</tr>"
}
neutron.qs("#ex4_table1>tbody").innerHTML := html

; Insert example 4 table 2 contents
Ex4_Table2 := [["Apple", 1], ["Orange", 2]]
for row, data in Ex4_Table2
{
	tr := neutron.doc.createElement("tr")
	for col, cell in data
	{
		td := neutron.doc.createElement("td")
		td.innerText := cell
		tr.appendChild(td)
	}
	neutron.qs("#ex4_table2>tbody").appendChild(tr)
}

; Show the GUI, with an initial size of 800 x 600. Unlike with a normal GUI
; this size includes the title bar area, so the "client" area will be slightly
; shorter vertically than if you were to make this GUI the normal way.
  
*/

neutron.Show("w800 h600") 
;SetTimer, DynamicContent, 2000 
Ex4_Submit3(neutron,event) 
return

; FileInstall all your dependencies, but put the FileInstall lines somewhere
; they won't ever be reached. Right below your AutoExecute section is a great
; location!
FileInstall, Simple.html, Simple.html

; The built in GuiClose, GuiEscape, and GuiDropFiles event handlers will work
; with Neutron GUIs. Using them is the current best practice for handling these
; types of events. Here, we're using the name NeutronClose because the GUI was
; given a custom label prefix up in the auto-execute section.
NeutronClose:
ExitApp
return

; above is before load

; --- Trigger AHK by page events ---
DynamicContent()
{ 
}
/*
Gameslist1(neutron,event) 
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
                    Msgbox, Error. %Gameexe% already has Geo11.
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
    } ;Gui Add, ComboBox, vcbx w200 vVersChoice, x32||x64 

}
*/
Example1_MouseMove(neutron, event)
{
    ; Some events, like MouseMove, have custom attributes that can be read.
    ; offsetX and offsetY contain the mouse position relative to the event that
    ; fired the event.
    event.target.innerText := Format("({:i}, {:i})", event.offsetX, event.offsetY)
}

Example1_MouseLeave(neutron, event)
{
    ; Reset the text of the MouseMove example when the mouse is no longer over
    ; it.
    event.target.innerText := %Gameexe%
} 

Ex4_Submit2(neutron, event)
{
    event.preventDefault()
    formData := neutron.GetFormData(event.target)

    ; Create the row element to add cells to
    tr := neutron.doc.createElement("tr")

    ; Create the first column cell and add it to the row
    td := neutron.doc.createElement("td")
    td.innerText := formData.ex4_item2
    tr.appendChild(td)

    ; Create the second column cell and add it to the row
    td := neutron.doc.createElement("td")
    td.innerText := formData.ex4_cost2
    tr.appendChild(td)

    ; Add the row to the table
    neutron.qs("#ex4_table2>tbody").appendChild(tr)
}

; --- Update page by Hotkey ---

; Limit this hotkey to only fire while our Neutron window is the active window.
#if WinActive("ahk_id" neutron.hWnd)

~1::UpdateKeyExample(neutron, "1", "active")
~2::UpdateKeyExample(neutron, "2", "active")
~3::UpdateKeyExample(neutron, "3", "active")
~4::UpdateKeyExample(neutron, "4", "active")
~1 Up::UpdateKeyExample(neutron, "1", "")
~2 Up::UpdateKeyExample(neutron, "2", "")
~3 Up::UpdateKeyExample(neutron, "3", "")
~4 Up::UpdateKeyExample(neutron, "4", "")

UpdateKeyExample(neutron, keyName, className) 
{
    ; Use the JavaScript function document.querySelectorAll to find elements
    ; based on a CSS selector.

    keyDivs := neutron.doc.querySelectorAll(".keys > div")

    ; Use Neutron's .Each() method to iterate through the HTMLCollection in a
    ; for loop.
    for i, div in neutron.Each(keyDivs)
    {
        ; Check if the div's innerText matches the key that was pressed
        if (div.innerText == keyName)
        {
            ; Update the div's className property to change its style on the fly
            div.className := className
        }
    }
}

Submitter(neutron, event)
{
    ; Some events have a default action that needs to be prevented. A form will
    ; redirect the page by default, but we want to handle the form data ourself.
    event.preventDefault()

    ; Use Neutron's GetFormData method to process the form data into a form that
    ; is easily accessed. Fields that have a 'name' attribute will be keyed by
    ; that, or if they don't they'll be keyed by their 'id' attribute.
    formData := neutron.GetFormData(event.target)

    ; You can access all of the form fields by iterating over the FormData
    ; object. It will go through them in the order they appear in the HTML.
    out := "Access all fields by iterating:`n"
    for name, value in formData
        out .= name ": " value "`n"
    out .= "`n"

    ; You can also get field values by name directly. Use object dot notation
    ; with the field name/id.
    out .= "Or access individual fields directly:`n"
    out .= "Hello " formData.firstName " " formData.lastName "!`n"
    if formData.remember
        out .= ""
    else
        out .= "You forgot to check the 'Remember Me' box :("

    ; Show the output
    MsgBox, %out%
}

Submit2(neutron, event)
{
    event.preventDefault()
    formData := neutron.GetFormData(event.target)

    ; When you iterate over a FormData object with multi-selected checkboxes or
    ; select elements, it will act like an object with duplicate keys. The same
    ; name will appear multiple times, once per selected item.
    out := "Access all fields by iterating:`n"
    for name, value in formData
        out .= name ": " value "`n"
    out .= "`n"

    ; Iterating over the entire set of form fields is useful in some situations,
    ; but often you'll want to just get all the options selected for a single
    ; multi-select form field. Use the FormData's .All() method to get all the
    ; values associated with one field name as a standard array.
    out .= "Or individually:`n"
    out .= "Foods: [ "
    for i, food in formData.All("food")
        out .= food " "
    out .= "]`n"
    out .= "Languages: [ "
    for i, language in formData.All("favLangs")
        out .= language " "
    out .= "]`n"

    ; The FormData object will combine a group of Radios with the same name
    ; under a single entry. Grab a Radio group's value using dot or bracket
    ; notation.
    out .= "Contact: " formData.contact "`n"

    ; Show the output
    MsgBox, %out%
}

; --- Dynamic Content Generation ---
/*
Ex4_Submit1(neutron, event)
{
	event.preventDefault()
	formData := neutron.GetFormData(event.target)
	
	; Generate the HTML we're going to add to the page. To do this, we use the
	; FormatHTML static method, which will run the values through an HTML escape
	; function before passing them on to the AHK Format function. This will
	; take care of any special sequences such as angle brackets or quotes that
	; exist in the data and keep them from breaking the page.
	html := neutron.FormatHTML("<tr><td>{}</td><td>{}</td>", formData.ex4_item1, formData.ex4_cost1)
	
	; Add our HTML to the page, as part of the table body. To do this, we'll be
	; using the element.insertAdjacentHTML function. However, if we wanted to
	; replace the body contents instead of adding to them, we could instead use
	; `.innerHTML := html`.
	;
	; Read more about element.insertAjacentHTML here:
	; https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentHTML
	neutron.qs("#ex4_table1>tbody").insertAdjacentHTML("beforeend", html)
; similar to above
;	X := Neutron.qs("#ex4_table1>tbody")

;		x.insertAdjacentHTML("beforeend")

}
*/
Ex4_Submit3(neutron, event)
{ 
    Global 
    GetAddresses() 
    delimiter = ","
    /*
    ; := A_AppDataCommon "\GameslistGeo11\Gamename.csv" 
    NextInstall := A_AppDataCommon "\GameslistGeo11\NextInstall.txt" 
    GamesUpdate := A_AppDataCommon "\GameslistGeo11\GamesUpdate.txt" 

    Logdir := A_AppDataCommon "\GameslistGeo11"
    Helix := A_AppDataCommon "\GameslistGeo11\HelixLocal.txt" 
    Helix := A_ScriptDir "\Simple.html" 
    HTMLFile := A_AppDataCommon "\GameslistGeo11\HTMLfile.txt" 
    msgbox, f yourself %LogGames%
    */
    html:=LoadInstalled(html)
    /*
    CSV_Load(LogGames, "data")
    Rows:=CSV_TotalRows("data")
    html:=""
    Loop, % Rows
    {
        Row:=A_Index
        Rowdata:=CSV_ReadCell("data",Row,2) 
        if (Rowdata!="")
        {
            html= 
            (
            <option value="%Rowdata%" id="myH2">%Rowdata%</option> 
            %html%
            )
        }
    }
    */ 

    /*
    Loop, Read, %HTMLFile%
    {
        html=
(
%A_LoopReadLine%

%html%
)
    }
    */ 
    neutron.qs("#myH2data").innerHTML:=""
    neutron.qs("#myH2data").innerHTML:=html

/*
Model:=CSV_ReadCell("data", 2,2)
CSV_ModifyCell("data", "Mustang", 2, 2) ; change E350 to Mustang
MsgBox % CSV_Search("data", "name")
Result:=CSV_Search("data", "street")
MsgBox % CSV_ReadCell("data", Result[1],Result[2])

Loop, % Columns
	{
	 found:=CSV_Search("data", "street", A_Index)
	 if found=0
		break
	 Results .= found "`n"
     msgbox, %Results%
	}

MsgBox % Results
    */
 /* 
CSV_ReadCol(CSV_Identifier, ColNumber) 

 For index, value in Stored1
        { 
            geo .=  Stored1[index] 
            html .= 
(
<option value="%geo%">%geo%</option> 
)
            FileCopy, %DllLocal%\%geo%, %Gamepath%\geo\%geo%, 1
        }
  
            else
            {
                Stored := Cell[2]
                Stringer= 
(
%Stringer%
<option value="%Stored%">%Stored%</option> `n
)
            }
        }
    }
    FileAppend, %Stringer%, %HTMLFile%

	html := Stringer
	msgbox, %html%  
    document.getElementById("myList").appendChild(node);
    neutron.qs("#ex4_table2>tbody").appendChild(tr)
neutron.qs("#ex4_table2>tbody").appendChild(tr)

    */ 
}

;above is submit3 
;above is submit3 
;above is submit3 

BrowseButton(neutron, event)
{
    Global 
    event.preventDefault()
    GetAddresses()
    delimiter = ","
    /*
    LogGames := A_AppDataCommon "\GameslistGeo11\Gamename.txt" 
    NextInstall := A_AppDataCommon "\GameslistGeo11\NextInstall.txt" 
    GamesUpdate := A_AppDataCommon "\GameslistGeo11\GamesUpdate.txt" 

    Logdir := A_AppDataCommon "\GameslistGeo11"
    Helix := A_AppDataCommon "\GameslistGeo11\HelixLocal.txt" 
    HTMLFile := A_AppDataCommon "\GameslistGeo11\HTMLfile.txt" 
    ; event.target will contain the HTML Element that fired the event.
    ; Show a message box with its inner text.
    */ 
    FileSelectFile, Selectgame, 32, , Select a game, Application (*.exe)
    if (Selectgame = "")
        MsgBox, You didn't select anything.
    else
    {
        SplitPath, Selectgame, Gameexe, Gamepath, Gameextenstion, Gamenameonly

        if !FileExist(LogGames)
        {
            Games=
            (

%Selectgame%, %Gameexe%

)
            FileAppend,%Games%,%LogGames%
            GameError := 0 
        }
        Else
        { 
            Loop, read, %LogGames%
            { 
                Currentline := A_LoopReadLine
                LineRead := StrSplit(Currentline,delimiter)
                Gamename := LineRead[2]
                If InStr(Gamename, Gamenameonly)
                {

                    Msgbox, Error. %Gameexe% already has Geo11.
                    GameError := 1
                    break
                }
                else
                {
                    If (GameError!=1)
                    {
                        GameError:=0
                    }
                } 
            }
                /*
            MsgBox % TF_Find(LogGames, "", "", Gamenameonly, returnfirst=1,returntext=1)
           
            CSV_Load(LogGames, "data")
            Rows:=CSV_TotalRows("data")  
            Loop, % Rows
            {
                Row:=A_Index
                Rowdata:=CSV_ReadCell("data",Row,2) 
                If InStr(Rowdata,Gamenameonly)
                Msgbox, FOUND
            }

            msgbox, 3
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
                else
                {
                    If (GameError!=1)
                        GameError:=0
                }
            }
*/
            If (GameError="0") 
            { 
                HTMLPretext=
                (
%Selectgame%,%Gameexe%,%Gamepath%
)
                FileDelete, %GamesUpdate%
                FileAppend, %HTMLPretext%, %GamesUpdate%
                GameError := 0
                FileDelete, %HTMLFile%
                FileAppend, %HTMLPretext%, %HTMLFile% 
            } 
 
        }
    } 
    ;Gui Add, ComboBox, vcbx w200 vVersChoice, x32||x64
    ;Gui Add, ComboBox, vcbx w200 vVersChoice, x32||x64
    ;html := Gameexe 

}

Warning(neutron, event)
{
    Msgbox, For now, browse for your game first and then select your VR app location. For configure, that feature will be enabled later this weekend. 
    }

SubmitGen(neutron, event)
{
    Global
    event.preventDefault()
    ; Some events have a default action that needs to be prevented. A form will
    ; redirect the page by default, but we want to handle the form data ourself.
    GetAddresses()
    ; Use Neutron's GetFormData method to process the form data into a form that
    ; is easily accessed. Fields that have a 'name' attribute will be keyed by
    ; that, or if they don't they'll be keyed by their 'id' attribute.
    formData := neutron.GetFormData(event.target)
    if (Selectgame="")
        msgbox, Select a game
    else
    {
        SplitPath, Selectgame, Gameexe, Gamepath
 
        Loop, read, %GamesUpdate%
        { 
            Currentline := A_LoopReadLine
            
            if (Currentline="")
            continue
            else
                break
              }
              
         
              LineRead := StrSplit(Currentline,delimiter)
              Gameexe := LineRead[2]
              Selectgame := LineRead[1]
        ; You can access all of the form fields by iterating over the FormData
        ; object. It will go through them in the order they appear in the HTML. 

        ; You can also get field values by name directly. Use object dot notation
        ; with the field name/id. 
        vrapp := formData.vrapp
        gamevers := formData.gamevers 

         if FileExist(HelixLocal)
        {
            BinaryHelixFile := 1
            Loop, read, %HelixLocal%
            {
                CurrLine:=A_LoopReadLine
                if (CurrLine="") 
                    continue
                else
                {
                    HelixPath := CurrLine
                }
            } 

        }
        Else
            BinaryHelixFile := "0"
        If (HelixPath="")
        {
            BinaryHelixFile := "0"
        } 
        ; Show the output 

        if (gamevers="64x")
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

        array := ["d3d11.dll", "d3dcompiler_47.dll", "d3dx.ini", "d3dxdm.ini", "nvapi64.dll"]

        For index, value in array
        { 
            geo := % array[index] 
            FileCopy, %DllLocal%\%geo%, %Gamepath%\geo\%geo%, 1
        }
        FileDelete, %Gamepath%\leaveingamedir.exe
        FileDelete, %Gamepath%\pregame_move.bat
        FileDelete, %Gamepath%\postgame_move.bat
        FileCopy, %A_ScriptDir%\leaveingamedir.exe, %Gamepath%\leaveingamedir.exe, 1 
        FileCopy, %A_ScriptDir%\pregame_move.bat, %Gamepath%\pregame_move.bat, 1
        FileCopy, %A_ScriptDir%\postgame_move.bat, %Gamepath%\postgame_move.bat, 1
        FileCopyDir, %DllLocal%\ShaderFixes, %Gamepath%\ShaderFixes, 1

        Logfile := Gamepath "\Gamename.txt"
        Random, rand, 1, 12
        Localicon := A_ScriptDir "\ico\" rand ".ico" 
        TextforGamelog= 
        (

%Selectgame%,%Gameexe%

)
        HV:="0"
        VRL:="0"
        If (vrapp = "Helix Vision") 
        {
            HV:="1"
            VRL:="1"
        }
        if (vrapp= "Virtual Desktop" or vrapp="Other") 
        {
            HV:="0"
            VRL:="1"
            msgbox, This was designed to integrate with HelixVision, other VR apps won't have full resolution. 
        }
        if (HV="0" and VRL="0")
        {
            HV:="0"
            VRL:="0"
            msgbox, This was designed to integrate with HelixVision, other VR apps won't have full resolution. 
        }
        if (HV="0" and VRL="0")
        {
        Goto, NoDesktopApp
        msgbox, This was designed to integrate with HelixVision, other VR apps won't have full resolution. 
        }
        
        if (BinaryHelixFile=1)
        {
            msgbox, 4,, Is this the right path to %vrapp%? `n%HelixPath%
            IfMsgBox No
            Goto, KatangaGo1
            IfMsgBox Yes
            Goto, KatangaYes1
        }
        KatangaGo1:
        if (HL=1) 
          {  
            msgboxstored=
            (
Usually stored in C:\Program Files (x86)\Steam\steamapps\common\HelixVision\Tools\Katanga\katanga.exe
)
            }
            Msgbox, Select Path to %vrapp%. %msgboxstored%
            FileSelectFile, HelixPath, 32, , Select Kantagna Path, Application (*.exe)
            if (Selectgame = "")
                MsgBox, You didn't select anything.
            KatangaYes1: 
            FileDelete, %Logfile% ;  
            tester1=
            (
%Selectgame%
%HelixPath%
)
            FileAppend, %tester1%, %Logfile% 
                /*

                helix launcher batch for katanga

            */
            
        If (HV=1)
        {
            filedelete, %A_ScriptDir%\%HelixLauncherBat%
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
timeout /t 20
rem 
rem 
rem 
), %A_ScriptDir%\%HelixLauncherBat%
            Filedelete, %HelixLocal%
            FileAppend, %HelixPath%, %HelixLocal%
        }
        }  

        FileCopy, %A_ScriptDir%\%HelixLauncherBat%, %Gamepath%\%HelixLauncherBat%, 1 
        NoDesktopApp:
        FileAppend, %TextforGamelog%, %LogGames%
        html:=LoadInstalled(html) 

        empty:="" 
        neutron.qs("#myH2data").innerHTML:=empty
        sleep, 50
        neutron.qs("#myH2data").innerHTML:=html

        ShortcutMaker := A_Desktop "\" Gamenameonly " VR.lnk"
        AHKLocal := Gamepath "\leaveingamedir.exe" 
        FileCreateShortcut, %AHKLocal%, %ShortcutMaker%, %Gamepath%,,,%Localicon%
        Msgbox, Geo11 Shortcut sent to desktop. 
        Selectgame:=""
        FileDelete, %GamesUpdate%
        FileAppend, 
        (
        %Gamepath%\%Gameexe%,%Gameexe%,%Gamenameonly%
        ), %GamesUpdate%
/*            html:=LoadInstalled(html)
            
            neutron.doc.getElementById("myH2").insertAdjacentHTML("beforebegin",html)
        */
        Selectgame:=""
    } 
/*  
Storing(Stringer,Event)
{ 
    Loop, read, %LogGames%
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
        }
        else
            Stored := Cell[2]
        Stringer= 
        (
%Stringer%
<option value="%Stored%"> %Stringer% </option> 
        )
        return, %Stringer%
    }
} 

*/

Configure(neutron, event)
{ 
    Global 
    ; Some events have a default action that needs to be prevented. A form will
    ; redirect the page by default, but we want to handle the form data ourself.

    event.preventDefault()
    GetAddresses()
    ; Use Neutron's GetFormData method to process the form data into a form that
    ; is easily accessed. Fields that have a 'name' attribute will be keyed by
    ; that, or if they don't they'll be keyed by their 'id' attribute. 
    
    msgboxer := neutron.qs("#myH2").innerText 
    msgbox, %msgboxer%  
        Loop, Read, %LogGames%
        { 
            word_array := StrSplit(A_LoopReadLine, delimiter)  
            string:=word_array[1]
             if instr(string,msgboxer)
                 pathconfig:=A_LoopReadLine 
             if (string="")
                 continue
             else
             { 
             }
        }   
        Filedelete, %NextInstall%
        Fileappend, %pathconfig%, %NextInstall%  
        Template := A_ScriptDir "\" "Template.ahk"
        Run, %Template%, A_ScriptDir 
    }




Uninstaller(neutron, event)
{ 

    Global
    event.preventDefault()
    ; Some events have a default action that needs to be prevented. A form will
    ; redirect the page by default, but we want to handle the form data ourself.

    GetAddresses()
    ; Use Neutron's GetFormData method to process the form data into a form that
    ; is easily accessed. Fields that have a 'name' attribute will be keyed by
    ; that, or if they don't they'll be keyed by their 'id' attribute. 
    formData := neutron.GetFormData(event.target)
    for name, value in formData
        StoredGet:=value
    ; You can access all of the form fields by iterating over the FormData
    ; object. It will go through them in the order they appear in the HTML.  
    ; You can also get field values by name directly. Use object dot notation
    ; with the field name/id.   
        /*
        html= 
        (
        <option value="fuckyourself"> fuckyourself </option>
        )
    */
    Msgbox, 4,, Uninstall Geo11 for %StoredGet%?
    IfMsgBox Yes
    { 
        FSRemove(StoredGet)
        html:=""
        delimiter := ","
        Loop, read, %LogGames%
        { 
            if (A_LoopReadLine="") 
                continue
            else
            {
                Cell := StrSplit(A_LoopReadLine,delimiter)
                curgame := Cell[2]
                html=
                (
<option value="%curgame%" id="myH2" name="game">%curgame%</option> 

%html%
                )
            }            
        } 

            Loop, read, %GamesUpdate%
            {
                Currentline := A_LoopReadLine
                If InStr(Currentline, StoredGet)
                {
                    LineRead := StrSplit(Currentline,delimiter)
                    GameLocation := LineRead[1]
                    SplitPath, GameLocation, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
                    Filedelete, %OutDir%\geo\*.dll
                    Filedelete, %OutDir%\geo\*.ini
                    Filedelete, %OutDir%\leaveingamedir.exe
                    Filedelete, %OutDir%\pregame*.bat
                    Filedelete, %OutDir%\postgame*.bat
                    Filedelete, %OutDir%\VRLaun*.exe
                    Filedelete, %OutDir%\vrapplauncher.bat
                    ;FileAppend %A_LoopReadLine%`n
                    ;FileMove, %GamesUpdate%, %LogGames%, 1
                    LineNumber := A_Index - 1
                    EndLine := LineNumber + 1
                }
                else 
                    Continue
            }
        */ 
        Msgbox, Success `nThe UI will update when you restart. 
        Goto, Beginning
    } 
    Else
        Goto, Nevermind

    Beginning:
        /*
        html:=""
        LoadInstalled()
        looper:=LooperHtml(looper)
        msgbox, %html%
        */ 
        neutron.qs("#myH2data").innerHTML:=html
        sleep, 20
        /*
        neutron.doc.getElementById("myH2data").insertAdjacentHTML("afterbegin",html)
        ;neutron.doc.getElementById("myH2data").insertAdjacentHTML("afterbegin",html)
        */
    Nevermind:
    } 

    SetLocations()
    {
        ColumnNr := [1]
        delimiter := ","

        LogGames := A_AppDataCommon "\GameslistGeo11\Gamename.txt" 
        NextInstall := A_AppDataCommon "\GameslistGeo11\NextInstall.txt" 
        GamesUpdate := A_AppDataCommon "\GameslistGeo11\GamesUpdate.txt" 

        Logdir := A_AppDataCommon "\GameslistGeo11"
        HelixLocal := A_AppDataCommon "\GameslistGeo11\HelixLocal.txt" 
        HTMLFile := A_AppDataCommon "\GameslistGeo11\HTMLfile.txt" 
    }

