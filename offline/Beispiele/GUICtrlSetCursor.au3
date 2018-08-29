#include <GUIConstantsEx.au3>

Example()

Func Example()

	GUICreate("Setzt den Cursor über das Label", 300, 100)
	GUICtrlCreateLabel("Label", 125, 40)
	GUICtrlSetCursor(-1, 4)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Example
