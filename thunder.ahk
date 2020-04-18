#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#Persistent
ToolTip, 武僧宏启动成功 无需重复启动
SetTimer, RemoveToolTip, -2000
Return


start_power(){
    SetTimer AutoLButton,off
    Send +{Click Down}
    ;Hotkey, ~*$LButton , PushLbutton, On
    Hotkey, ~*$w up, PushLbutton, On
    Hotkey, ~*$XButton1 up, PushLbutton, On
    Hotkey, ~*$XButton2 up, PushLbutton, On
    SetTimer SendR,20
    SetTimer SendQ,1000
    SetTimer AutoRButton,20
}

close_power(){
    ;Hotkey, ~*$LButton ,,  off
    Hotkey, ~*$w up, PushLbutton, off
    Hotkey, ~*$XButton1 up, PushLbutton, off
    Hotkey, ~*$XButton2 up, PushLbutton, off
    Send +{Click Up}
    SetTimer SendR,off
    SetTimer SendQ,off
    SetTimer AutoRButton,off
    SetTimer AutoLButton,off
}

#IfWinActive ahk_exe Diablo III64.exe
{
    *$WheelDown:: 
        start_power()
    Return

    ~x & LButton::
        Send {Click}}
        Sleep 50
        Send {Enter}
    Return

    MButton::
        close_power()
        SetTimer AutoLButton,20
    Return

}


~*$WheelUp:: 
  close_power()
Return



RemoveToolTip:
ToolTip
return

PushLbutton:
    Send +{Click Down}

return

SendR(){
    Send r
    Return
}

SendQ(){
    Send q
    Return
}

AutoRButton(){
    PixelGetColor, OutputVar, 1294, 1331, RGB
    if(OutputVar = 0x9D8B5B){
        Send {click Right}
    }
}

AutoLButton(){
    Send {Click }
}