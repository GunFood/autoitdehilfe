#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit einem Edit-Feld") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	Local $idEdt_Myedit = GUICtrlCreateEdit("Erste Zeile" & @CRLF, 176, 32, 121, 97, $ES_AUTOVSCROLL + $WS_VSCROLL)

	GUISetState(@SW_SHOW)

	Send("{END}")

	; Wird hinzugefügt, 3. Parameter nicht vergessen!
	GUICtrlSetData($idEdt_Myedit, "Zweite Zeile", 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example
