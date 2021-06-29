#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Delay = 100 ;A delay is added for stability
ownKeyDelay = 40
DelayAbbility = 1500
SetKeyDelay, 0, ownKeyDelay

;food
XButton1::
  SendEvent {g}{v}
return
XButton2::
  SendEvent {g}{v}
return
; BEGIN swiftness
5::
    SendEvent {6}{6}{f4}{f4}
    SendEvent {Numpad5}{Numpad5}
    Sleep DelayAbbility
    SendEvent {7}{7}{NumpadSub}{NumpadSub}
Return
; END swiftness ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Ultimate
$h::
    SendEvent {6}{f4}
    SendEvent {h}
    Sleep DelayAbbility
    SendEvent {7}{NumpadSub}
Return
; END ultimate ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;BEGIN Bladed Dive Switch
~y::
    SendEvent {F1}{F2}
return
;END Bladed Dive Switch ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; MAIN HAND OFF HAND RETURN
`::
    SendEvent {NumpadSub}{NumpadSub}{NumpadMult}{NumpadMult}
return
$tab::
    SendEvent {NumpadSub}{NumpadSub}{NumpadMult}{NumpadMult}
return
;END MAIN HAND OFF HAND RETURN ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;BEGIN surge and scape

F5::
    SendEvent {f2}
    SendEvent {numpad4}
    Sleep 1100
    SendEvent {NumpadMult}
return
;END surge and scape ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;BEGIN flanking
$s::
    SendEvent {f3}{f3}{s}{s}
    Sleep 1000
    SendEvent {NumpadMult}{NumpadMult}
return
$f::
    SendEvent {f3}{f3}{f}{f}
    Sleep 1000
    SendEvent {NumpadMult}{NumpadMult}
return
;END flanking ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Natural instinct
$j::
    SendEvent 6
    Send, {j down}
    Sleep ownKeyDelay
    Send, {j up}
    Sleep DelayAbbility
    SendEvent 7
return
; END natural instinct ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

$+c::
  sendEvent {NumpadSub}
  sendEvent C
return

; adren bomb
~space::
  SendEvent {0}
return

!p::Suspend
