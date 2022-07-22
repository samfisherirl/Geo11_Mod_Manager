
#NoEnv
SetWorkingDir, %A_ScriptDir%
SetBatchLines -1
x:="T:\SteamLibrary\steamapps\common\DiRT 3 Complete Edition - Copy\geo\d3dx.ini"

;IniRead, OutputVar, %x%, Include, include
;MsgBox, The value is %OutputVar%.

Loop, Read, %x%
{  
    msgbox, % A_LoopReadLine
    Loop, parse, A_LoopReadLine, `n
    {
        if InStr(A_LoopReadLine,"ShaderFixes\upscale") 
        {
            msgbox found!
         }

        if InStr(A_LoopReadLine,"include = ShaderFixes\3dvision2sbs.ini") 
        {
        ShaderFixes := A_Index
        msgbox, 11111111111
        }

        if InStr(A_LoopReadLine,"upscaling = ") 
        {
        UpscaleMode := A_Index
        msgbox, 11111111111
        }

        if InStr(A_LoopReadLine,"resolution of your tv or monitor") 
        {
            ResX := A_Index + 1
            ResY := A_Index + 2 
        }    
    }
}  