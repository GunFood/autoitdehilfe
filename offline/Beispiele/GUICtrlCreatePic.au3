#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit Bild", 350, 300, -1, -1, $WS_SIZEBOX + $WS_SYSMENU) ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird.

	GUISetBkColor(0xE0FFFF)
	Local $idPic = GUICtrlCreatePic("..\GUI\mslogo.jpg", 50, 50, 200, 50)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	; Verändere die Größe des Controls
	GUICtrlSetPos($idPic, 50, 50, 200, 100)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		$idMsg = GUIGetMsg()

		If $idMsg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	GUIDelete()
EndFunc   ;==>Example
