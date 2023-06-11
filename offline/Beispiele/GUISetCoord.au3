#include <GUIConstantsEx.au3>

Example()

Func Example()
	Opt("GUICoordMode", 2) ; Relativ zum Zellen-Modus

	GUICreate("Meine GUI setzt Koordinaten", 320, 100)
	GUICtrlCreateCheckbox("Prüfen #1", 70, 10, 85)
	GUICtrlCreateCheckbox("Anzeigen #2", 10, -1) ; Nächste Zelle in der Zeile

	GUISetCoord(70, 60)

	GUICtrlCreateButton("OK #3", -1, -1)
	GUICtrlCreateButton("Abbrechen #4", 10, -1)
	GUICtrlSetState(-1, $GUI_FOCUS)

	GUISetState(@SW_SHOW) ; Macht die GUI sichtbar

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	GUIDelete()
EndFunc   ;==>Example
