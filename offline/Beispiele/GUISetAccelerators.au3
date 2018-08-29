#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Benutzerdefinierte Msgbox", 270, 80)

	GUICtrlCreateLabel("Bitte klicke einen Button an!", 70, 10)
	Local $idButton_Yes = GUICtrlCreateButton("Ja", 40, 50, 50, 20)
	Local $idButton_No = GUICtrlCreateButton("Nein", 110, 50, 50, 20)
	Local $idButton_Exit = GUICtrlCreateButton("Beenden", 180, 50, 50, 20)

	; Weist bestimmten Buttons Schnellzugriffstasten zu (für Strg+y und Strg+n)
	Local $aAccelKeys[2][2] = [["^y", $idButton_Yes], ["^n", $idButton_No]]
	GUISetAccelerators($aAccelKeys)

	GUISetState(@SW_SHOW) ; Zeigt die GUI an

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				MsgBox($MB_SYSTEMMODAL, "Betätigter Button", "Schließen")
				ExitLoop

			Case $idButton_Yes
				MsgBox($MB_SYSTEMMODAL, "Betätigter Button", "Ja") ; Erscheint wenn der button ausgewählt wurde oder der Hotkey Ctrl + y gedrückt würde

			Case $idButton_No
				MsgBox($MB_SYSTEMMODAL, "Betätigter Button", "Nein") ; rscheint wenn der button ausgewählt wurde oder der Hotkey Ctrl + n gedrückt würde

			Case $idButton_Exit
				MsgBox($MB_SYSTEMMODAL, "Betätigter Button", "Beenden")
				ExitLoop

		EndSwitch
	WEnd
	GUIDelete() ; Löscht die GUI
EndFunc   ;==>Example
