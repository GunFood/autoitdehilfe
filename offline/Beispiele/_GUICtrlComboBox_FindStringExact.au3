#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Finde den exakten String", 400, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBox_AddString($idCombo, "Dies ist ein Test")
	_GUICtrlComboBox_AddDir($idCombo, "", $DDL_DRIVES)
	_GUICtrlComboBox_AddString($idCombo, "Dies ist der exakte String")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; String finden
	MsgBox($MB_SYSTEMMODAL, "Information", "String gefunden: " & _GUICtrlComboBox_FindStringExact($idCombo, "Dies ist der exakte String"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
