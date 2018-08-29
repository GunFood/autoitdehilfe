#include <GUIConstantsEx.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit der Gruppierfunktion") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateGroup("Gruppe 1", 190, 60, 90, 140)
	GUICtrlCreateRadio("Radio 1", 210, 90, 60, 20)
	GUICtrlCreateRadio("Radio 2", 210, 110, 60, 50)
	GUICtrlCreateGroup("", -99, -99, 1, 1) ; Gruppe schliessen

	GUISetState(@SW_SHOW) ; Zeigt eine leere Dialogbox an

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example
