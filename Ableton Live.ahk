#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force
#IfWinActive ahk_exe Ableton Live 10 Suite.exe
Menu, Tray, Icon, shell32.dll, 189

SetTimer lol, 100

lol:
	if WinExist("Kontakt ahk_exe Ableton Live 10 Suite.exe", "Really replace? (changes will be lost)")
		Sendinput, {left}+{Enter}
	
	if WinExist("Confirm: ahk_exe Ableton Live 10 Suite.exe")
		ControlSend, , {Enter}
Return

applyPreset(Preset) {
SetKeyDelay, -1
CoordMode, Mouse, Screen
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, posx, posy
Send ^f
Send %Preset%
sleep, 250
MouseMove 208, 166, 0 ; <-- Get your own mouse position using Window Spy, it comes with AutoHotkey
Click, down
MouseMove %posx%, %posy%
Click, up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return
}

^Numpad3::applyPreset("serum vst")
^!Numpad5::applyPreset("Massive native instrument")
^Numpad7::applyPreset("sylenth 1 vst")
^Numpad6::applyPreset("utility")
^Numpad8::applyPreset("fabfilter pro c 2")
^Numpad9::applyPreset("fabfilter pro q 3")
^!Numpad1::applyPreset("insight 2")
^!Numpad4::applyPreset("fabfilter pro r")
^!Numpad3::applyPreset("repeater d16")
^!Numpad6::applyPreset("omnisphere")
^!Numpad7::applyPreset("ezdrummer")
^!Numpad8::applyPreset("Spire vst")
^!Numpad9::applyPreset("battery 4")
^!Home::applyPreset("kontakt 6")

;Instant plugin--search result
^!Numpad0::
SetKeyDelay, -1
CoordMode, Mouse, Screen
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, posx, posy
MouseMove 208, 166, 0
Click, down
MouseMove %posx%, %posy%
Click, up
BlockInput off
BlockInput Default
BlockInput MouseMoveOff 
Return
