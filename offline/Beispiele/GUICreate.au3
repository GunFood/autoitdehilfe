#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGui = GUICreate("Beispiel")
	Local $idOK = GUICtrlCreateButton("OK", 310, 370, 85, 25)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGui)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idOK
				ExitLoop

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete($hGui)
EndFunc   ;==>Example
