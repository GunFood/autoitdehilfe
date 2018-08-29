#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Opt("GUICoordMode", 1)

	GUICreate("Radio-Box-Gruppierung Demo", 400, 280)

	; Erzeugt die Controls
	Local $idButton_1 = GUICtrlCreateButton("B&utton 1", 30, 20, 120, 40)
	GUICtrlCreateGroup("Gruppe 1", 30, 90, 165, 160)
	GUIStartGroup()
	Local $idRadio_1 = GUICtrlCreateRadio("Radio &0", 50, 120, 70, 20)
	Local $idRadio_2 = GUICtrlCreateRadio("Radio &1", 50, 150, 60, 20)
	Local $idRadio_3 = GUICtrlCreateRadio("Radio &2", 50, 180, 60, 20)
	GUIStartGroup()
	Local $idRadio_4 = GUICtrlCreateRadio("Radio &A", 120, 120, 70, 20)
	Local $idRadio_5 = GUICtrlCreateRadio("Radio &B", 120, 150, 60, 20)
	Local $idRadio_6 = GUICtrlCreateRadio("Radio &C", 120, 180, 60, 20)
	GUIStartGroup()
	Local $idInput_1 = GUICtrlCreateInput("Eingabe 1", 200, 20, 160, 30)
	Local $idInput_2 = GUICtrlCreateInput("Eingabe 2", 200, 70, 160, 30)

	; Setzt die Standards (Radiobuttons geklickt, Standard-Button, etc)
	GUICtrlSetState($idRadio_1, $GUI_CHECKED)
	GUICtrlSetState($idRadio_6, $GUI_CHECKED)
	GUICtrlSetState($idButton_1, $GUI_FOCUS + $GUI_DEFBUTTON)

	; Initialisieren der im folgenden Beispiel benutzten Variablen
	Local $iRadioval1 = 0 ; Wir setzen voraus 0 = erster Radiobutton gewählt, 2 = letzter Button
	Local $iRadioval2 = 2

	GUISetState(@SW_SHOW)

	Local $idMsg
	; In dieser MessageBox-Schleife nutzen wir Variablen, um Änderungen der Radiobuttons im Auge zu behalten.
	; Ein anderer Weg wäre der Gebrauch von GUICtrlRead() am Ende, um den Status jedes Controls einzulesen.
	; Beide Methoden sind gleichermaßen zulässig.
	While 1
		$idMsg = GUIGetMsg()
		Select
			Case $idMsg = $GUI_EVENT_CLOSE
				Exit

			Case $idMsg = $idButton_1
				MsgBox($MB_SYSTEMMODAL, "Button", "Radio " & $iRadioval1 & @CRLF & "Radio " & Chr($iRadioval2 + Asc("A")) & @CRLF & GUICtrlRead($idInput_1) & @CRLF & GUICtrlRead($idInput_2))

			Case $idMsg = $idRadio_1 Or $idMsg = $idRadio_2 Or $idMsg = $idRadio_3
				$iRadioval1 = $idMsg - $idRadio_1

			Case $idMsg = $idRadio_4 Or $idMsg = $idRadio_5 Or $idMsg = $idRadio_6
				$iRadioval2 = $idMsg - $idRadio_4

		EndSelect
	WEnd

	GUIDelete()
EndFunc   ;==>Example
