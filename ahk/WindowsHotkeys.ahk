﻿#Requires AutoHotkey v2.0

; Alt Windows Virtual Desktop keys
#^n::#^d ; Create new desktop with Win+Ctrl+N
#^u::#^F4 ; Close desktop with Win+Ctrl+U
#^h::#^Left ; Move to left desktop with Win+Ctrl+H
#^l::#^Right ; Move to right desktop with Win+Ctrl+L

SetCapsLockState "AlwaysOff"

; Alternate arrow keys - CapsLock + hjkl
CapsLock & h::Left
CapsLock & j::Down
CapsLock & k::Up
CapsLock & l::Right

; Alternate Delete - CapsLock + Backspace
CapsLock & Backspace::Delete