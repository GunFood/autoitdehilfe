#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Löscht einen String", 400, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Add drives
	_GUICtrlComboBox_AddDir($idCombo, "", $DDL_DRIVES, False)

	; Löscht einen String
	MsgBox($MB_SYSTEMMODAL, "Information", "Löscht den String bei Index 1")
	_GUICtrlComboBox_DeleteString($idCombo, 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
