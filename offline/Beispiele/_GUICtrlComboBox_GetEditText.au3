#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ComboBox: Setzt und ermittelt den Text im Edit-Control (v" & @AutoItVersion & ")", 600, 296)
	Local $idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Schreibt einen Text in das Edit-Control
	_GUICtrlComboBox_SetEditText($idCombo, StringFormat("%d - Etwas neuer Text", Random(1, 20, 1)))

	; Ermittelt den Text im Edit-Control
	MemoWrite("Text im Edit-Control: " & _GUICtrlComboBox_GetEditText($idCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
