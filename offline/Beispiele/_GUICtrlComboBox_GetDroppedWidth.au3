#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ComboBox: Setzt und ermittelt die Breite der aufgeklappten Liste (v" & @AutoItVersion & ")", 620, 296)
	Local $idCombo = GUICtrlCreateCombo("", 2, 2, 416, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Setzt die maximale erlaubte Breite
	_GUICtrlComboBox_SetDroppedWidth($idCombo, 500)

	; Ermittelt die Breite der aufgeklappten Liste
	MsgBox($MB_SYSTEMMODAL, "Information", "Breite der aufgeklappten Liste: " & _GUICtrlComboBox_GetDroppedWidth($idCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
