#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI (GetControlState)")
	Local $idCheckbox = GUICtrlCreateCheckbox("Checkbox", 10, 10)
	GUICtrlSetState(-1, 1) ; Checkbox markieren

	GUISetState(@SW_SHOW) ; Zeigt das leere GUI-Fenster

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	MsgBox($MB_SYSTEMMODAL, "Status", StringFormat("GUICtrlRead=%d\nGUICtrlGetState=%d", GUICtrlRead($idCheckbox), GUICtrlGetState($idCheckbox)))
EndFunc   ;==>Example
