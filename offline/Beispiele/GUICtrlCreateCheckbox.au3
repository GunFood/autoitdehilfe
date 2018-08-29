#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGui = GUICreate("Example", 300, 200)

	; Erstellt ein Checkbox-Control.
	Local $idCheckbox = GUICtrlCreateCheckbox("Standard Checkbox", 10, 10, 185, 25)
	Local $idButton_Close = GUICtrlCreateButton("Close", 210, 170, 85, 25)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGui)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idButton_Close
				ExitLoop

			Case $idCheckbox
				If _IsChecked($idCheckbox) Then
					MsgBox($MB_SYSTEMMODAL, "", "Die Checkbox ist angehakt.", 0, $hGui)
				Else
					MsgBox($MB_SYSTEMMODAL, "", "Die Checkbox ist nicht angehakt.", 0, $hGui)
				EndIf

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete($hGui)
EndFunc   ;==>Example

Func _IsChecked($idControlID)
	Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked
