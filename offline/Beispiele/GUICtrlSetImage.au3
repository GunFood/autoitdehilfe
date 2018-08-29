#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	GUICreate("Meine GUI") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateButton("Mein Bild-Button", 10, 20, 40, 40, $BS_ICON)
	GUICtrlSetImage(-1, "shell32.dll", 22)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Example
