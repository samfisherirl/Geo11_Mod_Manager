
#NoEnv
SetWorkingDir, %A_ScriptDir%
SetBatchLines -1
x:="T:\SteamLibrary\steamapps\common\DiRT 3 Complete Edition - Copy\geo\d3dx.ini"

;IniRead, OutputVar, %x%, Include, include
;MsgBox, The value is %OutputVar%.

Loop, read, %x%
{  
    Loop, parse, A_LoopReadLine, `n
    { 
        if Instr(A_LoopReadLine, "include = ShaderFixes\upscale.ini")
        {
            truer:=1
        }
    }
    If (truer=1)
    {
        JT:=A_Index
        msgbox, %JT%
    }
    truer:=0
}
