#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Datum erhalten", 210, 190)

	Local $idDate = GUICtrlCreateMonthCal("1953/03/25", 10, 10)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst. oder ein Timeout vorliegt
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $idDate
				MsgBox($MB_SYSTEMMODAL, "Fehlerbeseitigung", "Kalender angeklickt")
		EndSwitch
	WEnd

	MsgBox($MB_SYSTEMMODAL, "Datum", GUICtrlRead($idDate), 2)
EndFunc   ;==>Example
