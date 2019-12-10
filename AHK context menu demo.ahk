#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

;;;; This is a small demo and doesn't include all possible features of context menu in AHK

;;;; If you are familiar with the AHK documentation on "Menu",
;;;; you should understand what each line does

;;;; I suggest writing the functions/labels in a seperate txt file and use "#Include".

;;;; For more information on the parameters,
;;;; you should have already read the documentation and know what the parameters do!!!!!


;; ----------- Code Starts ---------------- ;;

; Go to the bottom first!!

Menu, Item1, Add, items in Item1, Label1 ; Adding "items in Item1" into "Item1"

Menu, Another submenu, Add, items in Another submenu, Label1 ; Adding "items in Another submenu" into "Another submenu"
Menu, Item1, Add, Another submenu, :Another submenu ; Adding another submenu into "Item1"

Menu, More submenus, Add, items in More submenus, Label1 ; Same as above
Menu, Another submenu, Add, More submenus, :More submenus ; Same as above

; Here is where you should start
; You have to create a menu before creating a submenu... I believe
Menu, testMenu, Add, Item1, :Item1 ; First submenu
;; Now you can go back

Menu, testMenu, Add, something, Label1 ; Shows up when you pull up the menu, it won't go into any submenus

!2:: Menu, testMenu, Show ; Shortcut to trigger the menu

Label1:
msgbox, You clicked it!!!
Return
