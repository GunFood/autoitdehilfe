#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI ermittelt das Datum", 200, 200, 800, 200)
	Local $idDate = GUICtrlCreateDate("1953/04/25", 10, 10, 185, 20)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	MsgBox($MB_SYSTEMMODAL, "Datum", GUICtrlRead($idDate))
	GUIDelete()
EndFunc   ;==>Example
