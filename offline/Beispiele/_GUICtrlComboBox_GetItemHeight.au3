#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ComboBox: Setzt und ermittelt die Höhe eines Items (v" & @AutoItVersion & ")", 500, 296)
	Local $idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt die Höhe des Items (Auswahlfeld)
	MemoWrite("Item Höhe (Auswahlfeld): " & _GUICtrlComboBox_GetItemHeight($idCombo))

	; Ermittelt die Höhe des Items (in der Liste)
	MemoWrite("Item Höhe (in der Liste): " & _GUICtrlComboBox_GetItemHeight($idCombo, 0))

	; Setzt die Höhe des Items (Auswahlfeld)
	_GUICtrlComboBox_SetItemHeight($idCombo, 18)

	; Setzt die Höhe des Items (in der Liste)
	_GUICtrlComboBox_SetItemHeight($idCombo, 20, 0)

	; Ermittelt die Höhe des Items (Auswahlfeld)
	MemoWrite("Item Höhe (Auswahlfeld): " & _GUICtrlComboBox_GetItemHeight($idCombo))

	; Ermittelt die Höhe des Items (in der Liste)
	MemoWrite("Item Höhe (in der Liste): " & _GUICtrlComboBox_GetItemHeight($idCombo, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
