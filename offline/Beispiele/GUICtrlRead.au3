#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Mein GUICtrlRead") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	Local $idMenu1 = GUICtrlCreateMenu("Datei")

	Local $idList = GUICtrlCreateList("", 10, 10, -1, 100)
	GUICtrlSetData(-1, "Eintrag1|Eintrag2|Eintrag3", "Eintrag2")

	Local $idButton = GUICtrlCreateButton("Lesen", 10, 150, 50)
	GUICtrlSetState(-1, $GUI_FOCUS) ; Der Fokus liegt auf diesem Button

	GUISetState(@SW_SHOW) ; Macht die GUI sichtbar

	Local $idMsg, $iMenustate, $sMenutext
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
		$idMsg = GUIGetMsg()
		If $idMsg = $idButton Then
			MsgBox($MB_SYSTEMMODAL, "Ausgewählter Listbox-Eintrag", GUICtrlRead($idList)) ; Zeigt den ausgewählten Listbox-Eintrag an
			$iMenustate = GUICtrlRead($idMenu1) ; Rückgabe des Zustandes des Menüpunktes
			$sMenutext = GUICtrlRead($idMenu1, 1) ; Rückgabe des Textes des Menüpunktes
			MsgBox($MB_SYSTEMMODAL, "Status und Text des Menüpunktes", "Status:" & $iMenustate & @CRLF & "Text:" & $sMenutext)
		EndIf
	Until $idMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
