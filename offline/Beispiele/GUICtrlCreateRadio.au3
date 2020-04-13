#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit Radiobuttons") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	$idRadio1 = GUICtrlCreateRadio("Radiobutton 1", 10, 10, 120, 20)
	$idRadio2 = GUICtrlCreateRadio("Radiobutton 2", 10, 40, 120, 20)
	GUICtrlSetState($idRadio2, $GUI_CHECKED)

	GUISetState(@SW_SHOW) ; Zeigt das GUI-Fenster mit 2 Radiobuttons

	Local $idMsg
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		$idMsg = GUIGetMsg()
		Select
			Case $idMsg = $GUI_EVENT_CLOSE
				ExitLoop
			Case $idMsg = $idRadio1 And BitAND(GUICtrlRead($idRadio1), $GUI_CHECKED) = $GUI_CHECKED
				MsgBox($MB_SYSTEMMODAL, 'Info:', 'Es wurde Radiobutton 1 angeklickt und ausgewählt')
			Case $idMsg = $idRadio2 And BitAND(GUICtrlRead($idRadio2), $GUI_CHECKED) = $GUI_CHECKED
				MsgBox($MB_SYSTEMMODAL, 'Info:', 'Es wurde Radiobutton 2 angeklickt und ausgewählt')
		EndSelect
	WEnd
EndFunc   ;==>Example
