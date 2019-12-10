#InstallKeybdHook
#SingleInstance force
;switching windows explorer
^Numpad0::
IfWinNotExist , ahk_class CabinetWClass
	Run , explorer.exe
GroupAdd , jjexplorer , ahk_class CabinetWClass ;You have to make a new group for each application , don't use the same one for all of them!
if WinActive("ahk_exe explorer.exe")
	GroupActivate , jjexplorer , r ;Activate the most recent window when activated
else
	WinActivate ahk_class CabinetWClass ;you have to use WinActivatebottom if you didn't create a window group. (Activate the most recent window when minimized)
Return

;windows always on top
^SPACE::  Winset , Alwaysontop ,  , A

;switching chrome 
^Numpad1::
IfWinNotExist , ahk_class Chrome_WidgetWin_1
	Run , chrome.exe
GroupAdd , chromebrowser , ahk_class Chrome_WidgetWin_1 ;You have to make a new group for each application , don't use the same one for all of them!
if WinActive("ahk_exe chrome.exe")
	GroupActivate , chromebrowser , r
else
	WinActivate ahk_class Chrome_WidgetWin_1 ;you have to use WinActivatebottom if you didn't create a window group.
Return

;swtiching AE
^!Numpad2::
IfWinNotExist , ahk_class AE_CApplication_16.0
	Run , AfterFX.exe
GroupAdd , jjae , ahk_class AE_CApplication_16.0 ;You have to make a new group for each application , don't use the same one for all of them!
if WinActive("ahk_exe AfterFX.exe")
	GroupActivate , jjae , r ;Activate the most recent window when activated
else
	WinActivate ahk_class AE_CApplication_16.0 ;you have to use WinActivatebottom if you didn't create a window group. (Activate the most recent window when minimized)
Return

;pasting in command prompt 
#IfWinActive ahk_class ConsoleWindowClass
^V::
SendInput {Raw}%clipboard%
return
#IfWinActive

/* ;Move Inactive windows
MoveInactiveWin.ahk
Move a window without activating it.
Skrommel @2006

#SingleInstance ,Force
SetWinDelay ,0
SetBatchLines ,-1
CoordMode ,Mouse ,Screen

applicationname=MoveInactiveWin

Gosub ,TRAYMENU
Return


!LButton::
MouseGetPos ,oldmx ,oldmy ,mwin ,mctrl
Loop
{
  GetKeyState ,lbutton ,LButton ,P
  GetKeyState ,alt ,Alt ,P
  If (lbutton="U" Or alt="U")
    Break
  MouseGetPos ,mx ,my
  WinGetPos ,wx ,wy ,ww ,wh ,ahk_id %mwin%
  wx:=wx+mx-oldmx
  wy:=wy+my-oldmy
  WinMove ,ahk_id %mwin% , ,%wx% ,%wy%
  oldmx:=mx
  oldmy:=my
}
Return


TRAYMENU:
Menu ,Tray ,NoStandard 
Menu ,Tray ,DeleteAll 
Menu ,Tray ,Add ,%applicationname% ,ABOUT
Menu ,Tray ,Add,
Menu ,Tray ,Add ,&About... ,ABOUT
Menu ,Tray ,Add ,E&xit ,EXIT
Menu ,Tray ,Default ,%applicationname%
Return


ABOUT:
Gui ,99:Destroy
Gui ,99:Margin ,20 ,20
Gui ,99:Add ,Picture ,xm Icon1 ,%applicationname%.exe
Gui ,99:Font ,Bold
Gui ,99:Add ,Text ,x+10 yp+10 ,%applicationname% v1.0
Gui ,99:Font
Gui ,99:Add ,Text ,y+10 ,Move a window without activating it
Gui ,99:Add ,Text ,y+10 ,- Alt-Click and drag to move.
Gui ,99:Add ,Text ,y+10 ,- Click anywhere within a window to move it.

Gui ,99:Add ,Picture ,xm y+20 Icon5 ,%applicationname%.exe
Gui ,99:Font ,Bold
Gui ,99:Add ,Text ,x+10 yp+10 ,1 Hour Software by Skrommel
Gui ,99:Font
Gui ,99:Add ,Text ,y+10 ,For more tools , information and donations , please visit 
Gui ,99:Font ,CBlue Underline
Gui ,99:Add ,Text ,y+5 G1HOURSOFTWARE ,www.1HourSoftware.com
Gui ,99:Font

Gui ,99:Add ,Picture ,xm y+20 Icon7 ,%applicationname%.exe
Gui ,99:Font ,Bold
Gui ,99:Add ,Text ,x+10 yp+10 ,DonationCoder
Gui ,99:Font
Gui ,99:Add ,Text ,y+10 ,Please support the contributors at
Gui ,99:Font ,CBlue Underline
Gui ,99:Add ,Text ,y+5 GDONATIONCODER ,www.DonationCoder.com
Gui ,99:Font

Gui ,99:Add ,Picture ,xm y+20 Icon6 ,%applicationname%.exe
Gui ,99:Font ,Bold
Gui ,99:Add ,Text ,x+10 yp+10 ,AutoHotkey
Gui ,99:Font
Gui ,99:Add ,Text ,y+10 ,This tool was made using the powerful
Gui ,99:Font ,CBlue Underline
Gui ,99:Add ,Text ,y+5 GAUTOHOTKEY ,www.AutoHotkey.com
Gui ,99:Font

Gui ,99:Show , ,%applicationname% About
hCurs:=DllCall("LoadCursor" ,"UInt" ,NULL ,"Int" ,32649 ,"UInt") ;IDC_HAND
OnMessage(0x200 ,"WM_MOUSEMOVE") 
Return

1HOURSOFTWARE:
  Run ,http://www.1hoursoftware.com , ,UseErrorLevel
Return

DONATIONCODER:
  Run ,http://www.donationcoder.com , ,UseErrorLevel
Return

AUTOHOTKEY:
  Run ,http://www.autohotkey.com , ,UseErrorLevel
Return

99GuiClose:
  Gui ,99:Destroy
  OnMessage(0x200 ,"")
  DllCall("DestroyCursor" ,"Uint" ,hCur)
Return

WM_MOUSEMOVE(wParam ,lParam)
{
  Global hCurs
  MouseGetPos , , , ,ctrl
  If ctrl in Static9 ,Static13 ,Static17
    DllCall("SetCursor" ,"UInt" ,hCurs)
  Return
}
Return


EXIT:
ExitApp
*/

;Switching Notepad
^Numpad4::
IfWinNotExist , ahk_class Notepad++
	Run , notepad++.exe
GroupAdd , JasonNotepad , ahk_class Notepad++ ;You have to make a new group for each application , don't use the same one for all of them!
if WinActive("ahk_exe notepad++.exe")
	GroupActivate , JasonNotepad , r
else
	WinActivate ahk_class Notepad++ 
Return

;Switching WinWord
^Numpad2::
IfWinNotExist , ahk_class OpusApp
	Run , WINWORD.EXE
GroupAdd , Jasonword , ahk_class OpusApp ;You have to make a new group for each application , don't use the same one for all of them!
if WinActive("ahk_exe WINWORD.EXE")
	GroupActivate , Jasonword , r
else
	WinActivate ahk_class OpusApp ;you have to use WinActivatebottom if you didn't create a window group.
Return

;Switching Excel
^Numpad5::
IfWinNotExist , ahk_class XLMAIN
	Run , EXCEL.EXE
GroupAdd , Jasonexcel , ahk_class XLMAIN ;You have to make a new group for each application , don't use the same one for all of them!
if WinActive("ahk_exe EXCEL.EXE")
	GroupActivate , Jasonexcel , r
else
	WinActivate ahk_class XLMAIN ;you have to use WinActivatebottom if you didn't create a window group.
Return
