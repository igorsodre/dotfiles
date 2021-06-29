#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Delay = 100 ;A delay is added for stability
ownKeyDelay = 40
DelayAbbility = 1500
SetKeyDelay, 0, ownKeyDelay
twoHanded = 1

;food
XButton1::
  SendEvent {g}{v}
return
XButton2::
  SendEvent {g}{v}
return

; BEGIN zerk
5::
  SendEvent {6}{6}
  SendEvent {Numpad5}{Numpad5}
  Sleep DelayAbbility
  SendEvent {7}{7}
return
; END zerk

~y::
  SendEvent {F1}{F1}{F2}{F2}
return
;END Bladed Dive Switch ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; MAIN HAND OFF HAND RETURN
`::
  SendEvent {NumpadSub}{NumpadSub}{NumpadMult}{NumpadMult}
  twoHanded = 0
return
$tab::
  SendEvent {NumpadSub}{NumpadSub}{NumpadMult}{NumpadMult}
  twoHanded = 0
return
; END MAIN HAND return ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;BEGIN flanking
$f::
  if (twoHanded = 0) {
    SendEvent {f3}{f3}{f}{f}
    Sleep 1000
    SendEvent {NumpadMult}{NumpadMult}
  } else {
    SendEvent {f}
  }
return

$s::
  if (twoHanded = 0) {
    SendEvent {f3}{f3}{s}{s}
    Sleep 1000
    SendEvent {NumpadMult}{NumpadMult}
  } else {
    SendEvent {s}
}
return

;END flanking ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Toggle pray
;BEGIN lunging
$r::
  if (twoHanded = 0) {
    SendEvent {f4}{f4}{r}{r}
    Sleep 1000
    SendEvent {NumpadSub}{NumpadSub}{NumpadMult}{NumpadMult}
  } else {
    SendEvent {r}
  }
return
;END lunging ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Natural instinct
$j::
  SendEvent {6}{6}
  Send, {j down}
  Sleep ownKeyDelay
  Send, {j up}
  Sleep DelayAbbility
  SendEvent {7}{7}
return
; END natural instinct ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

~k::
  if (twoHanded = 0) {
    twoHanded = 1
  } else
  {
    twoHanded = 0
  }
return

~^d::
  reload
return

$^x::
    SendEvent {f4}{f4}^{x}^{x}
    Sleep 1000
    SendEvent {NumpadSub}{NumpadSub}{NumpadMult}{NumpadMult}
return

$^f::
    SendEvent {f4}{f4}^{f}^{f}
    Sleep 1000
    SendEvent {NumpadSub}{NumpadSub}{NumpadMult}{NumpadMult}
return

~^q::
  reload
return

$+c::
  sendEvent {NumpadSub}
  sendEvent C
  reload
return

; adren bomb
~space::
  SendEvent {0}
return

!p::Suspend
