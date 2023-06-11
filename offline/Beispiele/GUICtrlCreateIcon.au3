#include <GUIConstantsEx.au3>

Example()

Func Example()
	GUICreate("Meine GUI Icons", 250, 250)

	GUICtrlCreateIcon("shell32.dll", 10, 20, 20)
	GUICtrlCreateIcon(@ScriptDir & '\Extras\horse.ani', -1, 20, 40, 32, 32)
	GUICtrlCreateIcon("shell32.dll", 7, 20, 75, 32, 32)
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
