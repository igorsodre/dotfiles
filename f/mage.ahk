#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Delay = 100 ;A delay is added for stability
ownKeyDelay = 40
DelayAbbility = 1500
SetKeyDelay, 0, ownKeyDelay
vulnActive = 0
flankActive = 0

;food
XButton1::
  SendEvent {g}{v}
return
XButton2::
  SendEvent {g}{v}
return
; BEGIN Sunshine
5::
    SendEvent {6}{f4}
    SendEvent {Numpad0}{Numpad5}
    Sleep DelayAbbility
    SendEvent {7}{NumpadSub}
Return
; END Sunshine ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;BEGIN flanking
$s::
    if (flankActive = 1) {
        SendEvent {f3}{s}
        Sleep 1000
        SendEvent {NumpadMult}
    } else {
        SendEvent {s}
    }
return
$f::
    if (flankActive = 1) {
        SendEvent {f3}{f}
        Sleep 1000
        SendEvent {NumpadMult}
    } else {
        SendEvent {f}
    }
return
;END flanking ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;BEGIN Bladed Dive Switch
~y::
    SendEvent {F1}{F2}
return
;END Bladed Dive Switch ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; MAIN HAND OFF HAND RETURN
`::
    SendEvent {NumpadSub}{NumpadMult}
return
$tab::
    SendEvent {NumpadSub}{NumpadMult}
return
; END MAIN HAND return ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; surge and scape
F5::
    SendEvent {F2}
    SendEvent {Numpad4}
    Sleep 1100
    SendEvent {NumpadMult}
return
; END Surge ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

~k::
    if (flankActive = 1) {
        flankActive = 0
    } else
    {
        flankActive = 1
    }
return

$+c::
  sendEvent {NumpadSub}
  sendEvent C
return

~Space::
    SendEvent 0
return

!p::Suspend
