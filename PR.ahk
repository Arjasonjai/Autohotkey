#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;; Some of the scripts are originally created by TaranVH, https://github.com/TaranVH, 
   but then I modified them the way I wanted them to be ;; 

;Premiere Pro
;------------
#SingleInstance force ;only one instance of this script may run at a time!
#InstallMouseHook
#IfWinActive ahk_exe Adobe Premiere Pro.exe 
; F1 - ripple delete clip or blank at playhead
^Q::
Send d^+!d
return

;zoom in
^WheelUp::
Send +H
return

;zoom out
^WheelDown::
Send -
Return

; hand tool
^!LButton::
Loop
{
If (GetKeyState("Control", "P") && GetKeyState("Alt", "P") && GetKeyState("LButton", "P")) { ;checks if the keys are held down
sleep 50 ; doesn't work without sleep
Send h ; shorcut for hand tool
Click, down ; as I set the hotkey to ctrl alt left mouse button, I have to virtually press down the mouse button for it to work
}
else { ; I don't know why I put this else here, just in case
Send %currentTool%
break
}
}
Click, up
sleep 50 ; sleep for no reason
Send %currentTool% ; I prefer going back to cursor mode.
return

v:: 
Send v
currentTool = %A_thishotkey%
return
f:: 
Send f
currentTool = %A_thishotkey%
return
x:: 
Send x
currentTool = %A_thishotkey%
return
+x:: 
Send +x
currentTool = %A_thishotkey%
return
p:: 
Send p
currentTool = %A_thishotkey%
return
h:: 
Send h
currentTool = %A_thishotkey%
return
t:: 
Send t
currentTool = %A_thishotkey%
return

;rigt click playhead
RButton::
timeline1 = 0xE4E4E4
timeline2 = 0x202020
timeline3 = 0x313131
timeline4 = 0x1B1B1B
timeline5 = 0x414141
;timeline6 = 0xDFDFDF
MouseGetPos , X , Y
PixelGetColor , kolor , %X% , %Y% , RGB
if (kolor = timeline1 ||kolor = timeline2 || kolor = timeline3 || kolor = timeline4 || kolor = timeline5)
{
click middle
if GetKeyState("Rbutton" , "P") = 1 ;<----THIS is the only way to phrase this query.
		{
		;tooltip , we are inside the IF now
		;sleep 1000
		;tooltip,
		loop
			{
			Send ^\ ;in premiere , this is set to "move playhead to cursor."
			sleep 16 ;this loop will repeat every 16 milliseconds.
			; if GetKeyState("$Rbutton") = U ; again , this does not work at all.
			if GetKeyState("Rbutton" , "P") = 0
				{
				;msgbox , , ,time to break ,1
				tooltip,
				goto theEnd
				break
			}
		}
	;tooltip,
	Send {escape} ;in case you end up inside the "delete" right click menu from the timeline
	;MouseClick , left
}
}
/* if else (kolor = timeline2)
{
click middle
if GetKeyState("Rbutton" , "P") = 1 ;<----THIS is the only way to phrase this query.
		{
		;tooltip , we are inside the IF now
		;sleep 1000
		;tooltip,
		loop
			{
			Send ^\ ;in premiere , this is set to "move playhead to cursor."
			sleep 16 ;this loop will repeat every 16 milliseconds.
			; if GetKeyState("$Rbutton") = U ; again , this does not work at all.
			if GetKeyState("Rbutton" , "P") = 0
				{
				;msgbox , , ,time to break ,1
				tooltip,
				goto theEnd
				break
			}
		}
	;tooltip,
	Send {escape} ;in case you end up inside the "delete" right click menu from the timeline
	;MouseClick , left
}
}

if else (kolor = timeline3)
{
click middle
if GetKeyState("Rbutton" , "P") = 1 ;<----THIS is the only way to phrase this query.
		{
		;tooltip , we are inside the IF now
		;sleep 1000
		;tooltip,
		loop
			{
			Send ^\ ;in premiere , this is set to "move playhead to cursor."
			sleep 16 ;this loop will repeat every 16 milliseconds.
			; if GetKeyState("$Rbutton") = U ; again , this does not work at all.
			if GetKeyState("Rbutton" , "P") = 0
				{
				;msgbox , , ,time to break ,1
				tooltip,
				goto theEnd
				break
			}
		}
	;tooltip,
	Send {escape} ;in case you end up inside the "delete" right click menu from the timeline
	;MouseClick , left
}
}
*/
else
	sendinput {Rbutton} ;this is to make up for the lack of a ~ in front of Rbutton. ... ~Rbutton. It allows the command to pass through , but only if the above conditions were NOT met.
theEnd:
Return


;instant presets>>workplace 1
^Numpad3::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , X , Y , W , H , Edit6 , ahk_class Premiere Pro
;sleep 500
; Click
; MouseMove , X ,Y , 0
Send +2
Send +f
Send ^a
MouseMove , 57 , 905 , 0
;sleep 500
;MouseMove , X+9 , Y+170 
Send impact glow preset
Click , down
MouseMove , %posx% , %posy% , 0
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return


;instant preset 
^Numpad6::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , X , Y , W , H , Edit6 , ahk_class Premiere Pro
;sleep 500
; MouseMove , X ,Y , 0
; Click
; Send ^a
;sleep 500
;MouseMove , X+9 , Y+170 
Send +2
Send +f
Send ^a
; MouseMove , 57 , 905 , 0
Send impact flash preset
MouseMove , 57 , 905 , 0
Click , down
MouseMove , %posx% , %posy% , 0
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return

;GetKeyState , statefirstcheck , LButton , P
;statefirstcheck := GetKeyState , F10 , P

/*
label:
SetKeyDelay , 0
;Until statefirstcheck = D
KeyWait , CapsLock , D
Click , Up
MouseMove , %posx% , %posy%
Hotkey , CapsLock , off
;Click
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return
*/


/* ;^Numpad6::
CoordMode , Mouse , Window
SetKeyDelay , 0
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On

MouseGetPos , posx , posy
global Xbegin = posx
global Ybegin = posy
ControlGetPos , Xcorner , Ycorner , Width , Height , DroverLord-WindowClass15 , ahk_class Premiere Pro

MouseMove , 494 , 281
Click
Send 117
Send Enter
Sleep , 10
MouseMove , 556 , 256
Click
Send 630
Send {Enter 2}
MouseMove , 496 256
;MouseMove , 1658 , 975
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 

LButton Down::
Click , Up
    MouseMove , %posx% , %posy%
    return
*/

;Search in effects panel
^Numpad7::
; ImageSearch , EX , EY , 17 , 703 , 1023 , 1187 , D:\Autohotkey\Effects.PNG
ControlGetPos , X , Y , W , H , Edit6 , ahk_class Premiere Pro
; MouseMove , X , Y , 0
; Click
Send +2
Send +f
Send ^a
; If ErrorLevel = 0
; {
; MouseMove , EX , EY , 0
; Click
; Send +f
; }
Return



resetFromAutoVFX()
{
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
}


findHotText()
{
MouseGetPos , xxx , yyy
PixelSearch , Px , Py , xxx+50 , yyy , xxx+350 , yyy , 0x25351D , 30 , Fast RGB
if ErrorLevel
	{
	 sleep 100
	 resetFromAutoVFX()
	}
else
	{
	 ;82 , 275>>308 , 290
	 Mousemove , Px+226 , Py+15 , 0
	 ; tooltip , where am I?
	 ; tooltip,
	}
	
	Click down left
	
	GetKeyState , statefirstcheck , F3 , P
	
	if statefirstcheck=U
		{
		 Click up left
		 Sleep 10
		 resetFromAutoVFX()
		}
		

Loop
		{
		blockinput , off
		blockinput , MouseMoveOff
		;tooltip , %VFXkey% Instant %foobar% mod
		tooltip , ;removes any tooltips that might exist.
		sleep 15
		GetKeyState , state , F3 , P
		if state = U
			{
			Click up left
			;tooltip , "%VFXkey% is now physically UP so we are exiting now"
			sleep 15
			resetFromAutoVFX()
			; MouseMove , Xbegin , Ybegin , 0
			; tooltip,
			; ToolTip ,  ,  ,  , 2
			; blockinput , off
			; blockinput , MouseMoveOff
			Return
			}
		}
}



Hottextpos()
{
MouseGetPos , xxx , yyy
PixelSearch , Pxpos , Pypos , 81 , 247 , 478 , 270 , 0x25351D , 30 , Fast RGB
if ErrorLevel
	{
	 sleep 100
	 resetFromAutoVFX()
	}
else
	{
	 ;81 , 246>>307 , 264
	 Mousemove , Pxpos+226 , Pypos+18 , 0
	 ; tooltip , where am I?
	 ; tooltip,
	}
	Click down left
	
	GetKeyState , statefirstcheck , F1 , P
	
	if statefirstcheck=U
		{
		 Click up left
		 Sleep 10
		 resetFromAutoVFX()
		}
		

Loop
		{
		blockinput , off
		blockinput , MouseMoveOff
		;tooltip , %VFXkey% Instant %foobar% mod
		tooltip , ;removes any tooltips that might exist.
		sleep 15
		GetKeyState , state , F1 , P
		if state = U
			{
			Click up left
			;tooltip , "%VFXkey% is now physically UP so we are exiting now"
			sleep 15
			resetFromAutoVFX()
			; MouseMove , Xbegin , Ybegin , 0
			; tooltip,
			; ToolTip ,  ,  ,  , 2
			; blockinput , off
			; blockinput , MouseMoveOff
			Return
			}
		}

}



Rotation()
{
MouseGetPos , xxx , yyy
PixelSearch , Pxpos , Pypos , 85 , 353 , 380 , 371 , 0x25351D , 30 , Fast RGB
if ErrorLevel
	{
	 sleep 100
	 resetFromAutoVFX()
	}
else
	{
	 ;81 , 246>>307 , 264
	 Mousemove , Pxpos+226 , Pypos+18 , 0
	 ; tooltip , where am I?
	 ; tooltip,
	}
	Click down left
	
	GetKeyState , statefirstcheck , F4 , P
	
	if statefirstcheck=U
		{
		 Click up left
		 Sleep 10
		 resetFromAutoVFX()
		}
		

Loop
		{
		blockinput , off
		blockinput , MouseMoveOff
		;tooltip , %VFXkey% Instant %foobar% mod
		tooltip , ;removes any tooltips that might exist.
		sleep 15
		GetKeyState , state , F4 , P
		if state = U
			{
			Click up left
			;tooltip , "%VFXkey% is now physically UP so we are exiting now"
			sleep 15
			resetFromAutoVFX()
			; MouseMove , Xbegin , Ybegin , 0
			; tooltip,
			; ToolTip ,  ,  ,  , 2
			; blockinput , off
			; blockinput , MouseMoveOff
			Return
			}
		}

}



Hottextposs()
{
MouseGetPos , F2posx , F2posy
;57 , 252 >>369 , 263 
Mousemove , 368 , 263 , 0


	Click down left
	
	GetKeyState , statefirstcheck , F2 , P
	
	if statefirstcheck=U
		{
		 Click up left
		 Sleep 10
		 resetFromAutoVFX()
		}
		

Loop
		{
		blockinput , off
		blockinput , MouseMoveOff
		; tooltip , %VFXkey% Instant %foobar% mod
		tooltip , ;removes any tooltips that might exist.
		sleep 15
		GetKeyState , state , F2 , P
		if state = U
			{
			Click up left
			; tooltip , "%VFXkey% is now physically UP so we are exiting now"
			sleep 15
			resetFromAutoVFX()
			; MouseMove , Xbegin , Ybegin , 0
			; tooltip,
			; ToolTip ,  ,  ,  , 2
			; blockinput , off
			; blockinput , MouseMoveOff
			Return
			}
		}

}


Restart()
{
MouseGetPos , posxxx , posyyy
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
Send +1
ControlGetPos  , Xcontrol , Ycontrol , Width , Height , DroverLord - Window Class1 , ahk_class Premiere Pro
;9 , 117>>26 , 233 (less often used)
XX := Xcontrol+17
YY := Ycontrol+116
MouseMove XX , YY , 0
; MouseMove Xcontrol , Ycontrol , 0
sleep 10
PixelGetColor , ccolor , XX , YY
if (ccolor = "0x7F7F7F") ;closed
	{
	click
	ImageSearch , ScaleX , ScaleY , 0 , 64 , 693 ,782 , D:\Autohotkey\scale.PNG
		if ErrorLevel = 0
		{
		 MouseMove , ScaleX , ScaleY , 0
		}
		
	}
else if (ccolor = "0x222222") ;opened
{
	blockinput , Mouse
	sleep 5
	ImageSearch , ScaleX , ScaleY , 0 , 64 , 693 ,782 , D:\Autohotkey\scale.PNG
	if ErrorLevel = 0
	{
	 MouseMove , ScaleX , ScaleY , 0
	}
	
}
}

;instant horizontal
F1::
MouseGetPos , posxxx , posyyy
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
Send +1
ControlGetPos  , Xcontrol , Ycontrol , Width , Height , DroverLord - Window Class1 , ahk_class Premiere Pro
;9 , 117>>26 , 233 (less often used)
XX := Xcontrol+17
YY := Ycontrol+116
MouseMove XX , YY , 0
; MouseMove Xcontrol , Ycontrol , 0
sleep 10
PixelGetColor , ccolor , XX , YY
if (ccolor = "0x7F7F7F") ;closed
	{
	click
	ImageSearch , possX , possY , 0 , 64 , 693 ,782 , D:\Autohotkey\Position.PNG
		if ErrorLevel = 0
		{
		 MouseMove , possX , possY , 0
		}
		
	}
else if (ccolor = "0x222222") ;opened
{
	blockinput , Mouse
	sleep 5
	ImageSearch , possX , possY , 0 , 64 , 693 ,782 , D:\Autohotkey\Position.PNG
	{
	 MouseMove , possX , possY , 0
	}
	
}
else if (colorr <> "0x222222" || colorr <> "0x7F7F7F" )
{
	Send u
	sleep 10
	Send u
	Restart()
	; ImageSearch , possX , possY , 0 , 64 , 693 ,782 , D:\Autohotkey\Position.PNG
	; if ErrorLevel = 0
	; {
	 ; MouseMove , possX , possY , 0
	; }	
}

else
	{
	tooltip , %colorr% not expected
	;play noise
	resetFromAutoVFX()
	}
	
Hottextpos(H)
MouseMove , posxxx , posyyy , 0
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return



;instant Vertical
F2::
MouseGetPos , posxxx , posyyy
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
Send +1
ControlGetPos  , Xcontrol , Ycontrol , Width , Height , DroverLord - Window Class1 , ahk_class Premiere Pro
;9 , 117>>26 , 233 (less often used)
XX := Xcontrol+17
YY := Ycontrol+116
MouseMove XX , YY , 0
; MouseMove Xcontrol , Ycontrol , 0
sleep 10
PixelGetColor , ccolor , XX , YY
if (ccolor = "0x7F7F7F") ;closed
	{
	click
	ImageSearch , F2posx , F2posy , 0 , 64 , 693 ,782 , D:\Autohotkey\Position.PNG
		if ErrorLevel = 0
		{
		 MouseMove , F2posx , F2posy , 0
		}
		
	}
else if (ccolor = "0x222222") ;opened
{
	blockinput , Mouse
	sleep 5
	ImageSearch , F2posx , F2posy , 0 , 64 , 693 ,782 , D:\Autohotkey\Position.PNG
	{
	 MouseMove , F2posx , F2posy , 0
	}
	
}
else if (colorr <> "0x222222" || colorr <> "0x7F7F7F" )
{
	Send u
	sleep 10
	Send u
	Restart()
	; ImageSearch , F2posx , F2posy , 0 , 64 , 693 ,782 , D:\Autohotkey\Position.PNG
	; if ErrorLevel = 0
	; {
	 ; MouseMove , F2posx , F2posy , 0
	; }	
}
Hottextposs(V)
MouseMove , posxxx , posyyy , 0
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return







;Instant Scale 
F3::
; CoordMode , Mouse , Screen
MouseGetPos , posxxx , posyyy
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
Send +1
ControlGetPos  , Xcontrol , Ycontrol , Width , Height , DroverLord - Window Class1 , ahk_class Premiere Pro
;9 , 117>>26 , 233 (less often used)
XX := Xcontrol+17
YY := Ycontrol+116
MouseMove XX , YY , 0
; MouseMove Xcontrol , Ycontrol , 0
sleep 10
PixelGetColor , ccolor , XX , YY
if (ccolor = "0x7F7F7F") ;closed
	{
	click
	ImageSearch , ScaleX , ScaleY , 0 , 64 , 693 ,782 , D:\Autohotkey\scale.PNG
		if ErrorLevel = 0
		{
		 MouseMove , ScaleX , ScaleY , 0
		}
		
	}
else if (ccolor = "0x222222") ;opened
{
	blockinput , Mouse
	sleep 5
	ImageSearch , ScaleX , ScaleY , 0 , 64 , 693 ,782 , D:\Autohotkey\scale.PNG
	if ErrorLevel = 0
	{
	 MouseMove , ScaleX , ScaleY , 0
	}
	
}
else if (colorr <> "0x222222" || colorr <> "0x7F7F7F" )
{
	Send u
	sleep 10
	Send u
	Restart()
	; ImageSearch , ScaleX , ScaleY , 0 , 64 , 693 ,782 , D:\Autohotkey\scale.PNG
	; if ErrorLevel = 0
	; {
	 ; MouseMove , ScaleX , ScaleY , 0
	; }
}

else
	{
	tooltip , %colorr% not expected
	;play noise
	resetFromAutoVFX()
	}

findHotText(Scale)
MouseMove , posxxx , posyyy , 0
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return





;Instant Rotation
F4::
; CoordMode , Mouse , Screen
MouseGetPos , posxxx , posyyy
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
Send +1
ControlGetPos  , Xcontrol , Ycontrol , Width , Height , DroverLord - Window Class1 , ahk_class Premiere Pro
;9 , 117>>26 , 233 (less often used)
XX := Xcontrol+17
YY := Ycontrol+116
MouseMove XX , YY , 0
; MouseMove Xcontrol , Ycontrol , 0
sleep 10
PixelGetColor , ccolor , XX , YY
if (ccolor = "0x7F7F7F") ;closed
	{
	click
	ImageSearch , ScaleX , ScaleY , 0 , 64 , 693 ,782 , D:\Autohotkey\rotation.PNG
		if ErrorLevel = 0
		{
		 MouseMove , ScaleX , ScaleY , 0
		}
		
	}
else if (ccolor = "0x222222") ;opened
{
	blockinput , Mouse
	sleep 5
	ImageSearch , ScaleX , ScaleY , 0 , 64 , 693 ,782 , D:\Autohotkey\rotation.PNG
	if ErrorLevel = 0
	{
	 MouseMove , ScaleX , ScaleY , 0
	}
	
}
else if (colorr <> "0x222222" || colorr <> "0x7F7F7F" )
{
	Send u
	sleep 10
	Send u
	Restart()
	; ImageSearch , ScaleX , ScaleY , 0 , 64 , 693 ,782 , D:\Autohotkey\rotation.PNG
	; if ErrorLevel = 0
	; {
	 ; MouseMove , ScaleX , ScaleY , 0
	; }	
}

else
	{
	tooltip , %colorr% not expected
	;play noise
	resetFromAutoVFX()
	}
	
Rotation()
MouseMove , posxxx , posyyy , 0
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return



/*;lock Audio track 1
^!Numpad1::
#IfWinActive ahk_exe Adobe Premiere Pro.exe
BlockInput , on
BlockInput , MouseMove
MouseGetPos , posx , posy
CoordMode Pixel ; , screen  ; IDK why but it works like this...
CoordMode Mouse , screen
ImageSearch , imgx , imgy , -2400 , 220 , 2544 , 1430 , D:\Autohotkey\unlocked A1.PNG
if ErrorLevel = 1
	ImageSearch , imgx , imgy , -2400 , 220 , 2544 , 1430 , D:\Autohotkey\unlocked A1 untargeted.PNG
	
if ErrorLevel = 1
{
goto try2
}
if ErrorLevel = 2
{
goto reset
}
if ErrorLevel = 0
{
MouseMove , imgx , imgy
sleep 5
click
goto reset
}

try2:
ImageSearch , imgx , imgy , -2400 , 220 , 2544 , 1430 , D:\Autohotkey\locked A1 untargeted.PNG
if ErrorLevel = 1
ImageSearch , imgx , imgy , -2400 , 220 , 2544 , 1430 , D:\Autohotkey\locked A1.PNG
if ErrorLevel = 2
{
goto reset
}
if ErrorLevel = 0
{
MouseMove , imgx , imgy
sleep 5
click
goto reset
}

reset:
{
MouseMove , posx , posy
blockinput , off
blockinput , MouseMoveOff
Sleep 10
}
Return
*/

;instant presets>>workplace 1
^!Numpad1::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , X , Y , W , H , Edit6 , ahk_class Premiere Pro

;sleep 500
; MouseMove , X ,Y , 0
; Click
; Send ^a
;sleep 500
;MouseMove , X+9 , Y+170 
Send +2
Send +f
Send ^a
Send impact flare preset
MouseMove , 57 , 905 , 0
; MouseMove , 38 , 55 , 0 , R
Click , down
MouseMove , %posx% , %posy% , 0
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return

;instant presets>>workplace 1
^!Numpad3::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , X , Y , W , H , Edit6 , ahk_class Premiere Pro

;sleep 500
; MouseMove , X ,Y , 0
; Click
; Send ^a
;sleep 500
;MouseMove , X+9 , Y+170 
Send +2
Send +f
Send ^a
Send impact light leaks preset
MouseMove , 57 , 905 , 0
; MouseMove , 38 , 55 , 0 , R
Click , down
MouseMove , %posx% , %posy% , 0
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return


;instant presets>>workplace 1
^!Numpad5::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , X , Y , W , H , Edit6 , ahk_class Premiere Pro

;sleep 500
; MouseMove , X ,Y , 0
; Click
; Send ^a
; sleep 500
; 40 , 840 >> 58 , 905
Send +2
Send +f
Send ^a
Send valhalla room
MouseMove , 56, 956 , 0
; MouseMove , 18 , 65 , 0 , R
Click , down
MouseMove , %posx% , %posy% , 0
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return

; instant preset--impact wipe
^!Numpad0::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , X , Y , W , H , Edit6 , ahk_class Premiere Pro

;sleep 500
; MouseMove , X ,Y , 0
; Click
; Send ^a
; sleep 500
; 40 , 840 >> 72 , 1059
Send +2
Send +f
Send ^a
Send impact wipe
MouseMove , 74 , 1056 , 0
; MouseMove , 32 , 219 , 0 , R
Click , down
MouseMove , %posx% , %posy% , 0
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return

; instant preset--impact zoom blur
^Numpad8::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , X , Y , W , H , Edit6 , ahk_class Premiere Pro

;sleep 500
; MouseMove , X ,Y , 0
; Click
; Send ^a
; sleep 500
; 40 , 840 >> 72 , 1059
Send +2
Send +f
Send ^a
Send impact zoom blur
MouseMove , 74 , 1056 , 0
Click , down
MouseMove , %posx% , %posy% , 0
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return

; instant preset--Swish pan
^Numpad9::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , X , Y , W , H , Edit6 , ahk_class Premiere Pro

;sleep 500
; MouseMove , X ,Y , 0
; Click
; Send ^a
; sleep 500
; 40 , 840 >> 72 , 1059Send +2
Send +2
Send +f
Send ^a
Send swish pan
MouseMove , 73 , 1106 , 0
Click , down
MouseMove , %posx% , %posy% , 0
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return

/*
; instant preset--knoll light transition
^!Numpad9::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , X , Y , W , H , Edit6 , ahk_class Premiere Pro

;sleep 500
MouseMove , X ,Y , 0
Click
Send ^a
; sleep 500
; 40 , 840 >> 72 , 1059
Send knoll light transition
MouseMove , 32 , 219 , 0 , R
Click , down
MouseMove , %posx% , %posy% , 0
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return

; instant preset--exposure blur
^!Home::
SetKeyDelay , -1
CoordMode , Mouse , Screen
BlockInput , SendAndMouse
BlockInput , MouseMove
BlockInput , On
MouseGetPos , posx , posy
ControlGetPos , X , Y , W , H , Edit6 , ahk_class Premiere Pro

;sleep 500
MouseMove , X ,Y , 0
Click
Send ^a
; sleep 500
; 40 , 840 >> 72 , 1059
Send uni.exposure blur
MouseMove , 32 , 267 , 0 , R
Click , down
MouseMove , %posx% , %posy% , 0
Click , up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return
*/

;This is the real magic. With this script, you can PASTE those previously saved clipboard states, at any time.

saveToFile(name) {
	;code below does not use any fancy variables. It's a bare string. Unfortunately, I can't find a way to make it work better...
	;change this path ----|                  																 and this one --------|    to your own folder locations.
	;    	              |																										  |
	;                     v																									  	  v
	RunWait, %comspec% /c D:\insideclipboard\InsideClipboard.exe /saveclp %name%, D:\insideclipboard
	
	
	;just saving the below lines of code, which didn't work because %pathh% nor %Exec% variables could not be defined properly. Or something... IDK....
	;RunWait, %comspec% /c %Exec% /saveclp %name%, c:\Users\TaranWORK\Downloads\Taran extra keyboards\insideclipboard\clipboards\
	;RunWait, %comspec% /c %Exec% /saveclp %name%, %pathh%
	
}


loadFromFile(name) {
	; You'll need to change these paths too!
	RunWait, %comspec% /c D:\insideclipboard\InsideClipboard.exe /loadclp %name%, D:\insideclipboard
}

saveClipboard(int) {
	StringReplace, int, int, +, , All ;replace + with nothing. This is just in case A_thishotkey contains + if shift was used!
	StringReplace, int, int, !, , All ;replace ! with nothing. This is just in case A_thishotkey contains ! if alt was used!
	StringReplace, int, int, ^, , All ;replace ^ with nothing. This is just in case A_thishotkey contains ^ if ctrl was used!
	;msgbox, , , saving as %int%, 0.6
	tooltip, saving as`n"clip" . %int% . ".clp"
	sleep 10
	SendInput, {Shift Down}{Shift Up}{Ctrl Down}{c Down}
	sleep 20
	ClipWait, 0.25 ; this line might not be needed.
	SendInput, {c up}{Ctrl up}
	sleep 20
	saveToFile("clip" . int . ".clp")
	sleep 1000
	saveToFile("clip" . int . ".clp")
	tooltip,
}


recallClipboard(int, transition := 0) {
	IfWinActive, ahk_class Premiere Pro
	{
	BlockInput, SendAndMouse
	BlockInput, MouseMove
	BlockInput, On
	;deactivate keyboard and mouse
	;keyShower(int, "recallClipboard")
	if IsFunc("Keyshower") {
		Func := Func("Keyshower")
		RetVal := Func.Call(int, "recallClipboard") 
	}
	WinActivate, Adobe Premiere Pro
	Send +{3}	;prFocus("timeline")
	;Send ^!d ;this is to deselect any clips that might be selected in the timeline.
	;tooltip, "now loading random text into the clipboard."
	loadFromFile("clipTEXT.clp") ;to create this file, just highlight some plain text, copy it, and use insideclipboard.exe to save it as clipTEXT.clp. The clipboard MUST have some text inside; it CANNOT be completely empty. This has the effect of DELETING all the aspects of the clipboard, EXCEPT for text.
	sleep 15
	; ; WinActivate, Adobe Premiere Pro ;IDK if this is needed here.
	; ; loadFromFile("clipTEXT.clp") ;The clipboard must be loaded twice, or it won't work about 70% of the time! I don't know why...
	; ; sleep 15
	;Autohotkey can now delete that string of text, so that no text is accidentlaly pasted into premiere. It doesn't seem to be able to delete EVERYTHING, so the above code is definitely necessary!
	clipboard = 
	;The clipboard is now completely empty.
	sleep 10
	
	;tooltip, now pasting NOTHING into premiere....
	WinActivate, Adobe Premiere Pro ;extremely important to ensure you are still active/focused on Premiere
	SendInput, {Shift Down}{Shift Up}
	sleep 10
	SendInput, {Ctrl Down}{v Down} ;this is a MUCH more robust way of using the keyboard shortcuts to PASTE, rather than just using "Send ^v"
	sleep 5
	SendInput, {v Up}{Ctrl Up}
	sleep 20
	
	;It is necessary to PASTE this COMPLETELY BLANK clipboard into premiere, or Premiere won't "know" that the clipboard has been completely emptied.
	;If you don't do this, Premiere will just use whatever thing you had previously copied inside of Premiere.
	clipboard = 
	;the above line is another method for clearing the clipboard that must also be done to ensure a totally empty clipboard
	sleep 30
	;tooltip, "clip" . %int% . ".clp" ;this code doesn't work
	;tooltip, now preparing to paste %int%
	;msgbox, %int%
	WinActivate, Adobe Premiere Pro 
	loadFromFile("clip" . int . ".clp") ;now we are loading the previously saved clipboard file!
	sleep 15
	; ; loadFromFile("clip" . int . ".clp") ;This must be done twice, or it doesn't work! I don't know why!! :D ;ADENDUM - i tried it with only 1 load and NOW it IS working??? IDK why
	; ; sleep 15
	WinActivate, Adobe Premiere Pro ;this is extremely important.... otherwise, it will try to paste into the command prompt or something. You must ensure the correct program is pasted into.
	
	; ; ; if (transition = 0)
	; ; ; {
		; ; ; target("v1", "off", "all", 5) ;this will disable all video layers, and enable only layer 5.
		; ; ; tooltip, only layer 5 was turned on should be
		; ; ; sleep 150
		
	; ; ; }
	tooltip, now PASTING into premiere...
	WinActivate, Adobe Premiere Pro
	SendInput, {Shift Down}{Shift Up}{Ctrl Down}{v Down}
	sleep 5
	SendInput, {v Up}{Ctrl Up}
	sleep 10
	
	;the below code doesn't work very well.
	; sleep 100
	;If (transition = 1){
	; ;now if we want an accurate label colorwe have to DELETE what we just did, since none of the label colors will be correct due to a premiere bug.
	; ;tooltip,,,gonna delete now,1
	; tooltip,gonna delete now
	; WinActivate, Adobe Premiere Pro
	; prFocus("timeline")
	; WinActivate, Adobe Premiere Pro
	; SendInput, +{delete} ;ripple delete
	; sleep 100
	
	; ;now to paste again, now that the label colors have been loaded.
	; ;REDO might also work. must test that.
	; WinActivate, Adobe Premiere Pro
	; prFocus("timeline")
	; sleep 30
	; SendInput, {Shift Down}{Shift Up}{Ctrl Down}{v Down}
	; ClipWait, 0.50
	; SendInput, {v Up}{Ctrl Up}
	; sleep 10
	;}
	
	
	if (transition = 0)
	;	target("v1", "on", "all")
	sleep 10
	; send ^{F9} ;toggle video tracks (hopefully off)
	; send ^+{F9} ;toggle audio tracks (hopefully off)
	tooltip,
	Send, ^+{a} ;this is to deselect any clips that might be selected in the timeline. WAS ctrl alt D. might be unreliable.
	BlockInput off
	BlockInput Default
	BlockInput MouseMoveOff 
}
} ;end of recall Clipboard()
