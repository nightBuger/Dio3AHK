﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#Persistent
ToolTip, 武僧宏启动成功 无需重复启动
SetTimer, RemoveToolTip, -2000
Return

SendR(){
    Send r
    Return
}

AutoRButton(){
    PixelGetColor, OutputVar, 1294, 1331, RGB
    if(OutputVar = 0x9D8B5B){
        Send {click Right}
    }
}

AutoLButton(){
    Send +{Click Down}
}

start_power(){
    Send +{Click Down}
    ;Hotkey, ~*$LButton , PushLbutton, On
    Hotkey, ~*$w , PushLbutton, On
    SetTimer SendR,20
    SetTimer AutoRButton,20
    SetTimer AutoLButton,20
}

close_power(){
    ;Hotkey, ~*$LButton ,,  off
    Hotkey, ~*$w , , off
    Send +{Click Up}
    SetTimer SendR,off
    SetTimer AutoRButton,off
    SetTimer AutoLButton,off
}

#IfWinActive ahk_exe Diablo III64.exe
{
    *$WheelDown:: 
        start_power()
    Return
}

~*$WheelUp:: 
  close_power()
Return

RemoveToolTip:
ToolTip
return

PushLbutton:
    Send +{Click Up}
    Send +{Click Down}
return

