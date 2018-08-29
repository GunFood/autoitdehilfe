#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sText, $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt einen Text der ListBox", 400, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt einen Text der List
	_GUICtrlComboBox_GetLBText($idCombo, 2, $sText)
	MsgBox($MB_SYSTEMMODAL, "Information", "ListBox Text: " & $sText)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
