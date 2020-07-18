; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

#z::Run www.autohotkey.com

^!n::
IfWinExist Untitled - Notepad
	WinActivate
else
	Run C:\Program Files\Notepad++\notepad++.exe
return


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.

; https://nickjanetakis.com/blog/remap-and-set-global-hotkeys-on-windows-10-with-auto-hotkey
; Remap hotkeys
; CapsLock::Esc
; Esc::CapsLock

; Global hotkeys
; #c::Run, explorer.exe D:\courses\deploying
; #i::Run, C:\Program Files\GIMP 2\bin\gimp-2.10.exe
; #n::Run, explorer.exe D:\src\sites\nickjanetakis
; #m::Run, foobar2000.exe
#t::Run, %UserProfile%\AppData\Local\wsltty\bin\mintty.exe --WSL="Ubuntu-18.04" --configdir="%UserProfile%\AppData\Roaming\wsltty" -~
#+t::Run, *RunAs %UserProfile%\AppData\Local\wsltty\bin\mintty.exe --WSL="Ubuntu-18.04" --configdir="%UserProfile%\AppData\Roaming\wsltty" -~
#w::Run chrome.exe
#+w::Run chrome.exe -incognito
#+D::Run explorer.exe C:\Users\shukl\Downloads
#+O::Run C:\Users\shukl\Downloads\NEW_SOFTWARES\DittoPortable_64bit_3_22_88_0\Ditto\Ditto.exe
#+K::Run C:\Users\shukl\Downloads\NEW_SOFTWARES\keypirinha-2.24-full-portable\Keypirinha\keypirinha.exe
#+H::Run, C:\Program Files\Notepad++\notepad++.exe C:\Users\shukl\Documents\AutoHotkey.ahk


