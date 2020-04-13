#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $sFilePath = "..\GUI\logo_autoit_210x72.gif"

	; Erstellt eine GUI mit verschiedenen Controls
	Local $hGui = GUICreate("Beispiel", 400, 100)
	GUICtrlCreatePic("..\GUI\msoobe.jpg", 0, 0, 400, 100)

	; Zeigt die GUI.
	GUISetState(@SW_SHOW, $hGui)

	Local $hChild = GUICreate("", 210, 72, 20, 15, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $hGUI)

	; Erstellt ein Picture Control mit einem transparenten Bild.
	GUICtrlCreatePic($sFilePath, 0, 0, 210, 72)

	; Zeigt die child GUI.
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete($hGui)
	GUIDelete($hChild)
EndFunc   ;==>Example
