#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Opt("GUICoordMode", 2)
	GUICreate("Meine InputBox", 190, 114, -1, -1, $WS_SIZEBOX + $WS_SYSMENU) ; Legt den Stil fest

	GUISetFont(8, -1, "Arial")

	GUICtrlCreateLabel("Eingabeaufforderung", 8, 7) ; Fügt Info hinzu
	GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP)

	Local $idButton_Edit = GUICtrlCreateInput("Standard", -1, 3, 175, 20, $ES_PASSWORD) ; Fügt das Input-Control hinzu
	GUICtrlSetState($idButton_Edit, $GUI_FOCUS)
	GUICtrlSetResizing($idButton_Edit, $GUI_DOCKBOTTOM + $GUI_DOCKHEIGHT)

	Local $idButton_OK = GUICtrlCreateButton("OK", -1, 3, 75, 24) ; Fügt den Button hinzu, der die GUI schliesst
	GUICtrlSetResizing($idButton_OK, $GUI_DOCKBOTTOM + $GUI_DOCKSIZE + $GUI_DOCKHCENTER)

	Local $idButton_Cancel = GUICtrlCreateButton("Abbrechen", 25, -1) ; Fügt den Button hinzu, der die GUI schliesst
	GUICtrlSetResizing($idButton_Cancel, $GUI_DOCKBOTTOM + $GUI_DOCKSIZE + $GUI_DOCKHCENTER)

	GUISetState(@SW_SHOW) ; Macht die GUI sichtbar

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Example
