#include <GUIConstantsEx.au3>

Example()

Func Example()
	GUICreate("Meine GUI") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateCombo("", 10, 10)

	GUICtrlSetData(-1, "Eintrag1|Eintrag2|Eintrag3", "Eintrag3")

	GUISetState(@SW_SHOW) ; Macht die GUI sichtbar

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Example
