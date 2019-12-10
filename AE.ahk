#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_exe AfterFX.exe
;zoom in
^WheelUp::
Send {=}
return

;zoom out
^WheelDown::
Send {-}
return

/*
;instant effect>>particular
^Numpad3::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , conX , conY , W , H , Edit15 , ahk_class AE_CApplication_16.0
MouseMove conX , conY , 0
Click
Send ^a
Send particular
;2335 , 442>>2336 , 490
MouseMove 1 , 48 , 0 , R
Click , down
MouseMove %posx% , %posy%
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return
*/

;instant effect>>particular
^Numpad3::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ImageSearch , imgX , imgy , 1717 , 0 , 2524 , 1402 , D:\Autohotkey\effects&presets.PNG
if Errorlevel = 0
MouseMove , imgx , imgy  , 0
; 2029 , 104 >> 2029 , 138 >> 2058 , 187 
MouseMove , 0 , 34 , 0 , R
Click
Send particular
Sleep 100
MouseMove , 29 , 48 , 0 , R
Click, down
MouseMove %posx% , %posy%
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return

/*
;instant effect>>optical flares
^Numpad6::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , conX , conY , W , H , Edit15 , ahk_class AE_CApplication_16.0
MouseMove conX , conY , 0
Click
Send ^a
Send optical flares
;2335 , 442>>2336 , 490
MouseMove 1 , 48 , 0 , R
Click , down
MouseMove %posx% , %posy%
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return
*/

;instant effect>>optical flares
^Numpad6::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ImageSearch , imgX , imgy , 1717 , 0 , 2524 , 1402 , D:\Autohotkey\effects&presets.PNG
if Errorlevel = 0
MouseMove , imgx , imgy  , 0
; 2029 , 104 >> 2029 , 138 >> 2058 , 187 
MouseMove , 0 , 34 , 0 , R
Click
Send Optical flares
Sleep 100
MouseMove , 29 , 48 , 0 , R
Click , down
MouseMove %posx% , %posy%
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return

/*
;instant effect>>Fast Box blur
^Numpad7::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , conX , conY , W , H , Edit15 , ahk_class AE_CApplication_16.0
MouseMove conX , conY , 0
Click
Send ^a
Send Fast Box blur
;2335 , 442>>2336 , 490
MouseMove 1 , 48 , 0 , R
Click , down
MouseMove %posx% , %posy%
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return
*/

;instant effect>>fast box blur
^Numpad7::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ImageSearch , imgX , imgy , 1717 , 0 , 2524 , 1402 , D:\Autohotkey\effects&presets.PNG
if Errorlevel = 0
MouseMove , imgx , imgy  , 0
; 2029 , 104 >> 2029 , 138 >> 2058 , 187 
MouseMove , 0 , 34 , 0 , R
Click
Send fast box blur
Sleep 100
MouseMove , 29 , 48 , 0 , R
Click , down
MouseMove %posx% , %posy%
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return

