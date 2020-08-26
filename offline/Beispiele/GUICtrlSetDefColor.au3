#include <GUIConstantsEx.au3>

Beispiel()

Func Beispiel()
	GUICreate("Test GUISetTextColor", 100, 100) ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlSetDefColor(0xFF0000) ; Ändert die Textfarbe für alle definierten Controls

	GUICtrlCreateLabel("Label", 10, 5)

	GUICtrlCreateRadio("Radio", 10, 25, 50)
	GUICtrlSetColor(-1, 0x0000FF) ; Ändert die Textfarbe für alle definierten Controls

	GUICtrlCreateButton("Button", 10, 55)

	GUISetState(@SW_SHOW) ; Macht die GUI sichtbar

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Beispiel
