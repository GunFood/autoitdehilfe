; == GUICtrlCreateLabel() überlappende Steuerelemente

#include <GUIConstants.au3>

Local $hGUI = GUICreate("Beispiel", 300, 200)

Local $idLabel = GUICtrlCreateLabel(" Label, das den gesamten Client-Bereich überlappt", 0, 0, 300, 200, $WS_CLIPSIBLINGS)
; $WS_CLIPSIBLINGS impliziert einen kleinen Performance-Nachteil
; siehe https://social.msdn.microsoft.com/Forums/en-US/dcd6a33c-2a6f-440f-ba0b-4a5fa26d14bb/when-to-use-wsclipchildren-and-wsclipsibilings-styles?forum=vcgeneral
; Es ist daher besser Steuerelemente nicht zu überlappen
; Local $idLabel = GUICtrlCreateLabel(" Label, das keine anderen Steuerelemente überlappt", 0, 0, 290, 170)

Local $idClose = GUICtrlCreateButton("Schließen", 210, 170, 85, 25)
GUICtrlSetState(-1, $GUI_ONTOP)

GUISetState()

While True
  Switch GUIGetMsg()
    Case $GUI_EVENT_CLOSE, $idClose
      ExitLoop
    Case $idLabel
      ConsoleWrite("Label" & @CRLF)
  EndSwitch
WEnd
