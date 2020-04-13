#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>

Example()

Func Example()
	GUICreate("Mein GUI-Stil") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateLabel("Mein Label welches auf mehrere Zeilen verteilt wird", 10, 20, 150, 100)
	GUICtrlSetStyle(-1, $SS_RIGHT)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Example
