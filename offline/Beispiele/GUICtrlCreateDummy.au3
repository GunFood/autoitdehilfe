#include <GUIConstantsEx.au3>

Example()

Func Example()

	$gui = GUICreate("GUICtrlCreateDummy", 250, 200, 100, 200)
	GUISetBkColor(0x00E0FFFF) ; Ändert die Hintergrundfarbe

	$idDmy_User = GUICtrlCreateDummy()
	$idButton_Event = GUICtrlCreateButton("OK", 75, 170, 70, 20)
	$idButton_Cancel = GUICtrlCreateButton("Abbrechen", 150, 170, 70, 20)
	GUISetState(@SW_SHOW)

	Local $idMsg
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
		$idMsg = GUIGetMsg()

		Select
			Case $idMsg = $idButton_Event
				GUICtrlSendToDummy($idDmy_User)
			Case $idMsg = $idButton_Cancel
				GUICtrlSendToDummy($idDmy_User)
			Case $idMsg = $idDmy_User
				; Besondere Anweisungen vor Skriptende
				; ...
				Exit
		EndSelect
	Until $idMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
