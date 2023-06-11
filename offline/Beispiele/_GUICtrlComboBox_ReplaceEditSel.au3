#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ersetzt den Text im Input-Control", 450, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Schreibt einen Text in das Input-Control
	_GUICtrlComboBox_SetEditText($idCombo, "Alter Text im Input-Control")

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	Sleep(750)

	; Setzt den neuen Text in dem Input-Control
	_GUICtrlComboBox_SetEditSel($idCombo, 0, -1)

	Sleep(750)

	; Begrenze den Text in dem Input-Control
	_GUICtrlComboBox_ReplaceEditSel($idCombo, "Neuer Text im Input-Control")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
