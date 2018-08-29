#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

Global $g_idMemo

Example()

Func Example()
	Local $aSel, $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Wählt Zeichen im Edit-Control aus", 450, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Item auswählen
	_GUICtrlComboBox_SetCurSel($idCombo, 2)

	; Wählt Zeichen im Edit-Control
	_GUICtrlComboBox_SetEditSel($idCombo, 0, 4)

	; Ermittelt Zeichen im Edit-Control
	$aSel = _GUICtrlComboBox_GetEditSel($idCombo)
	MemoWrite(StringFormat("Markierung: %d - %d", $aSel[0], $aSel[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
