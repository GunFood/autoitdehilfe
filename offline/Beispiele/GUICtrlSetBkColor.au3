#include <ColorConstants.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGui = GUICreate("Beispiel", 300, 200)

	; Erstellt ein Label-Control.
	Local $idLabel = GUICtrlCreateLabel("Ein Textstring", 10, 10, 185, 17)
	Local $idButton_Close = GUICtrlCreateButton("Schließen", 210, 170, 85, 25)

	; Setzt die Hintergrundfarbe des Label-Controls.
	GUICtrlSetBkColor($idLabel, $COLOR_RED)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGui)

	; Schließt das Editorfenster durch die Verwendung des Klassennamens (classname) vom Editor.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idButton_Close
				ExitLoop

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete($hGui)
EndFunc   ;==>Example
