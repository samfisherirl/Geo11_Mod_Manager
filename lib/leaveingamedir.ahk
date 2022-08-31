#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
delimiter:=","
Logfile := A_ScriptDir "\Gamename.txt"
OrigDir := A_ScriptDir "\OriginalDx"
FileCreateDir, %OrigDir%        
Loop, Read, %Logfile%
{ 
    word_array := StrSplit(A_LoopReadLine, delimiter)  
    string:=word_array[1] 
    if (A_Index=1)
    OutputVar:=string
        if (A_Index=2)
                Helix:=string
    
}
 
SplitPath, Helix,Helixexe,Helixpath,
SplitPath, OutputVar, Gameexe, Gamepath, Gameextenstion, Gamenameonly
arraygeo := ["d3d11.geo", "d3dcompiler_47.geo", "d3dx.geo", "d3dxdm.geo", "nvapi64.geo"]
arrayorig := ["d3d11.orig", "d3dcompiler_47.orig", "d3dx.orig", "d3dxdm.orig", "nvapi64.orig"]
arraydll := ["d3d11.dll", "d3dcompiler_47.dll", "d3dx.ini", "d3dxdm.ini", "nvapi64.dll"]
BeforeLaunch(arraygeo, arrayorig, arraydll)
sleep, 1000

HelixLauncherBat := Gamepath "\" "vrapplauncher.bat"

sleep, 1000
Run %OutputVar%, A_ScriptDir
sleep, 10000
if WinExist("ahk_exe" Gameexe)
{
        Run %HelixLauncherBat%, A_ScriptDir
}
else
{
        Sleep, 5000
        Run %HelixLauncherBat%, A_ScriptDir
}

sleep, 4000
WinActivate, ahk_exe %Gameexe%
sleep, 4000
WinActivate, ahk_exe %Gameexe%
sleep, 4000
WinActivate, ahk_exe %Gameexe%
Loop, 10
{
        ; CHECK FOR GAME LAUNCH CORRECTLY 1
        if WinExist("ahk_exe" Gameexe)
        {
                Exister := "1"
                Break
        }
        Else
        {
                Exister := "2"
                Sleep, 1000
        }
}
if (Exister="1")
{
        Loop
        {
                if !WinExist("ahk_exe" Gameexe)
                {
                        WinWaitClose, ahk_exe Gameexe
                        AfterLaunch(arraygeo, arrayorig, arraydll)
                        Process, Close, vr-screen-cap.exe
                        Exitapp
                        Break
                }
                else
                        Sleep, 1000
        }
}
else
{
        OnMessage(0x44, "OnMsgBox")
        MsgBox 0x84, %Gameexe% never launched, Should the VR launcher continue to wait for %Gameexe%? (App can be closed in system tray)
                OnMessage(0x44, "")

        IfMsgBox Yes, {
                Sleep, 100000
                WinWaitClose, ahk_exe Gameexe
                AfterLaunch(arraygeo, arrayorig, arraydll)
                exitapp
        } Else IfMsgBox No, {
                AfterLaunch(arraygeo, arrayorig, arraydll)
                exitapp
        }

        OnMsgBox() {
                DetectHiddenWindows, On
                Process, Exist
                If (WinExist("ahk_class #32770 ahk_pid " . ErrorLevel)) {
                        SendMessage 0x172, 1,, Static1 ; STM_SETIMAGE
                }
        }

}
return

BeforeLaunch(arraygeo, arrayorig, arraydll)
{
        run, pregame_move.bat
        sleep, 1000
}

AfterLaunch(arraygeo, arrayorig, arraydll)
{

        run, postgame_move.bat
        sleep, 1000
}