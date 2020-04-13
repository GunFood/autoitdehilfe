#include <GUIConstantsEx.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit dem Hinweis-Control") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateLabel("mein Label", 10, 20)
	GUICtrlSetTip(-1, "Hinweis meines Labels")

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Example
