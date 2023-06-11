#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

; Drücke den Button, um die Werte der Checkboxen anzuzeigen
; Das Skript ermittelt auch Statusänderungen (geschlossen/minimiert/Timeouts, etc).
Func Example()
	Opt("GUICoordMode", 1)
	GUICreate("Radio Box Demo", 400, 280)

	; Erzeugt die Controls
	Local $idButton_1 = GUICtrlCreateButton("B&utton 1", 30, 20, 120, 40)
	GUICtrlCreateGroup("Gruppe 1", 30, 90, 165, 160)
	GUIStartGroup()
	Local $idRadio_1 = GUICtrlCreateRadio("Radiobutton &0", 50, 120, 80, 20)
	GUICtrlCreateRadio("Radiobutton &1", 50, 150, 80, 20)
	Local $idRadio_3 = GUICtrlCreateRadio("Radiobutton &2", 50, 180, 80, 20)

	; Initialisierung der Variablen um GUI-Ereignisse im Auge zu behalten
	Local $iRadioVal1 = 0 ; Annahme: erster Radiobutton ausgewählt = 0, letzter Button = 2

	; GUI anzeigen
	GUISetState(@SW_SHOW)

	Local $idMsg = 0
	; In dieser Nachrichtenschleife werden Variablen benutzt, um die Radiobuttons im Auge zu behalten, ein anderer
	; Weg wäre der Gebrauch von GUICtrlRead() am Ende um den Status jedes Controls einzulesen
	While 1
		$idMsg = GUIGetMsg()
		Select
			Case $idMsg = $GUI_EVENT_CLOSE
				MsgBox($MB_SYSTEMMODAL, "", "Dialog wurde beendet")
				Exit
			Case $idMsg = $GUI_EVENT_MINIMIZE
				MsgBox($MB_SYSTEMMODAL, "", "Dialog wurde minimiert", 2)
			Case $idMsg = $GUI_EVENT_RESTORE
				MsgBox($MB_SYSTEMMODAL, "", "Dialog wurde wiederhergestellt", 2)
			Case $idMsg = $idButton_1
				MsgBox($MB_SYSTEMMODAL, "Standard-Button gedrückt", "Radiobutton " & $iRadioVal1)
			Case $idMsg >= $idRadio_1 And $idMsg <= $idRadio_3
				$iRadioVal1 = $idMsg - $idRadio_1
		EndSelect
	WEnd

	GUIDelete()
EndFunc   ;==>Example
