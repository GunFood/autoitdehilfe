#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGui = GUICreate("Beispiel", 420, 200, -1, -1, -1, $WS_EX_ACCEPTFILES)

	; Erstellt ein Label und setzt den Status "Drop"-Aktionen annehmen.
	Local $idLabel = GUICtrlCreateLabel("Ziehe eine Datei auf dieses Label.", 10, 10, 400, 40, $WS_BORDER)
	GUICtrlSetState($idLabel, $GUI_DROPACCEPTED)

	; Erstellt ein Input und setzt den Status "Drop"-Aktionen annehmen.
	Local $idInput = GUICtrlCreateInput("", 10, 60, 400, 22)
	GUICtrlSetState($idInput, $GUI_DROPACCEPTED)

	Local $idButton_OK = GUICtrlCreateButton("OK", 310, 370, 85, 25)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGui)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idButton_OK
				ExitLoop

			Case $GUI_EVENT_DROPPED
				; Falls der Wert von @GUI_DropId $idLabel ist, so wird der Pfad und Dateiname in das Label geschrieben.
				If @GUI_DropId = $idLabel Then GUICtrlSetData($idLabel, @GUI_DragFile)

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete($hGui)
EndFunc   ;==>Example
