#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $aRect, $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt die Bildschirmkoordinaten im ausgeklappten Zustand", 530, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 526, 296)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 526, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt die Bildschirmkoordinaten der Combobox mit ausgeklappter Listbox
	$aRect = _GUICtrlComboBox_GetDroppedControlRect($idCombo)
	MemoWrite("X-Koordinate der oberen linken Ecke ......: " & $aRect[0])
	MemoWrite("Y-Koordinate der oberen linken Ecke ......: " & $aRect[1])
	MemoWrite("X-Koordinate der unteren rechten Ecke ....: " & $aRect[2])
	MemoWrite("Y-Koordinate der unteren rechten Ecke ....: " & $aRect[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
