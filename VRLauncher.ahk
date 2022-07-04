#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Logfile := A_ScriptDir "\Gamename.txt"
FileRead, OutputVar, %Logfile%
SplitPath, OutputVar, Gameexe, Gamepath, Gameextenstion, Gamenameonly
arraygeo := ["d3d11.geo", "d3dcompiler_47.geo", "d3dx.geo", "d3dxdm.geo", "nvapi64.geo"]
arrayorig := ["d3d11.orig", "d3dcompiler_47.orig", "d3dx.orig", "d3dxdm.orig", "nvapi64.orig"]
arraydll := ["d3d11.dll", "d3dcompiler_47.dll", "d3dx.ini", "d3dxdm.ini", "nvapi64.dll"]
BeforeLaunch(arraygeo, arrayorig, arraydll) 
sleep, 1000
Run %Gameexe%, A_ScriptDir
Loop, 10
{
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
        exitapp
        }
        else
        Sleep, 1000
        }
}
else 
{
        msgbox, error %Gameexe% never started 
        AfterLaunch(arraygeo, arrayorig, arraydll)
}
return

BeforeLaunch(arraygeo, arrayorig, arraydll)
{ 

        For index, value in arraydll
        { 
                val := % value
                orig := % arrayorig[index] 
                geo := % arraygeo[index] 
                FileMove, %val%, %orig% 
                sleep, 10 
        } 
        sleep, 1500
        For index, value in arraydll
        { 
                val := % value
                orig := % arrayorig[index] 
                geo := % arraygeo[index] 
                FileMove, %geo%, %val% 
                sleep, 10 
        } 
}

AfterLaunch(arraygeo, arrayorig, arraydll)
{

        For index, value in arraydll
        { 
                val := % value
                orig := % arrayorig[index] 
                geo := % arraygeo[index] 
                FileMove, %val%, %geo% 
                sleep, 10 
        } 
        sleep, 1500
        For index, value in arraydll
        { 
                val := % value
                orig := % arrayorig[index] 
                geo := % arraygeo[index] 
                FileMove, %orig%, %val% 
                sleep, 10 
        } 
}