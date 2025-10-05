#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit UpDown", -1, -1, -1, -1, $WS_SIZEBOX)

	Local $idInput = GUICtrlCreateInput("2", 10, 10, 50, 20)
	GUICtrlCreateUpdown($idInput)

	; Versuch das Eingabe-Control in der Größe zu verändern
	GUICtrlSetPos($idInput, 10, 10, 100, 40)

	GUISetState(@SW_SHOW)

	Local $idMsg
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		$idMsg = GUIGetMsg()

		Switch $idMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	MsgBox($MB_SYSTEMMODAL, "Updown", GUICtrlRead($idInput))
EndFunc   ;==>Example
