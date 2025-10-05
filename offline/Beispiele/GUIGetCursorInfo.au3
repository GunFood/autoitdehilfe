#include <GUIConstantsEx.au3>

Global $g_idLbl_X = 0, $g_idLbl_Y = 0

Example()

Func Example()
	HotKeySet("{ESC}", "GetPos")

	GUICreate("Esc drücken um die Position zu erhalten", 400, 400)
	$g_idLbl_X = GUICtrlCreateLabel("0", 10, 10, 50)
	$g_idLbl_Y = GUICtrlCreateLabel("0", 10, 30, 50)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	GUIDelete()
EndFunc   ;==>Example

Func GetPos()
	Local $a = GUIGetCursorInfo()
	GUICtrlSetData($g_idLbl_X, $a[0])
	GUICtrlSetData($g_idLbl_Y, $a[1])
EndFunc   ;==>GetPos
