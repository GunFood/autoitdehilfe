#include <FontConstants.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Verwendete Schriftart der Controls.
	Local Const $sFont = "Comic Sans Ms"

	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGui = GUICreate("Beispiel", 300, 200)

	; Erstellt Label-Controls.
	GUICtrlCreateLabel("Ein unterstrichener Textstring", 10, 10, 185, 17)
	GUICtrlSetFont(-1, 9, $FW_NORMAL, $GUI_FONTUNDER, $sFont) ; Setzt die Schrift des vorherigen Controls.

	Local $idLabel2 = GUICtrlCreateLabel("Ein kursiver Textstring", 10, 30, 185, 17)
	GUICtrlSetFont($idLabel2, 9, $FW_NORMAL, $GUI_FONTITALIC, $sFont) ; Setzt die Schrift der ControlID die in $iLabel2 gespeichert wurde.

	Local $idLabel3 = GUICtrlCreateLabel("Ein durchgestrichenerr Textstring", 10, 50, 290, 17)
	GUICtrlSetFont($idLabel3, 9, $FW_NORMAL, $GUI_FONTSTRIKE, $sFont) ; Setzt die Schrift der ControlID die in $iLabel3 gespeichert wurde.

	Local $idButton_Close = GUICtrlCreateButton("Schließen", 210, 170, 85, 25)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGui)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idButton_Close
				ExitLoop

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete($hGui)
EndFunc   ;==>Example
