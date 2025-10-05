#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGUI = GUICreate("Beispiel", 400, 400)
	Local $idBtn_OK = GUICtrlCreateButton("OK", 310, 370, 85, 25)

	Local $aWindow_Size = WinGetPos($hGUI)
	ConsoleWrite('Fensterbreite  = ' & $aWindow_Size[2] & @CRLF)
	ConsoleWrite('Fensterhöhe = ' & $aWindow_Size[3] & @CRLF)
	Local $aWindowClientArea_Size = WinGetClientSize($hGUI)
	ConsoleWrite('Breite des Clientbereichs des Fensters = ' & $aWindowClientArea_Size[0] & @CRLF)
	ConsoleWrite('Höhe des Clientbereichs des Fensters = ' & $aWindowClientArea_Size[1] & @CRLF)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGUI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idBtn_OK
				ExitLoop

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
