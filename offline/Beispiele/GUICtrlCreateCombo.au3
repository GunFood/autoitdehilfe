#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGui = GUICreate("Example", 300, 200)

	; Erstellt ein Combobox-Control.
	Local $idComboBox = GUICtrlCreateCombo("Item 1", 10, 10, 185, 20)
	Local $idButton_Close = GUICtrlCreateButton("Schließen", 210, 170, 85, 25)

	; Fügt der Combobox zusätzliche Items hinzu.
	GUICtrlSetData($idComboBox, "Item 2|Item 3", "Item 2")

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGui)

	Local $sComboRead = ""

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idButton_Close
				ExitLoop

			Case $idComboBox
				$sComboRead = GUICtrlRead($idComboBox)
				MsgBox($MB_SYSTEMMODAL, "", "Die Combobox zeigt momentan folgendes an: " & $sComboRead, 0, $hGui)

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete($hGui)
EndFunc   ;==>Example
