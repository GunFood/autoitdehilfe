#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $aList, $idCombo
	Opt("GUIDataSeparatorChar", ",") ; Gib als zweiten Parameter den Separator (Trennzeichen) an, der verwendet werden soll

	; Erstellt eine GUI
	GUICreate("ComboBox: Liste ermitteln", 400, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt alle vorhandenen Laufwerke zur Liste hinzu
	_GUICtrlComboBox_AddDir($idCombo, "", $DDL_DRIVES, False)

	; Inhalt der Liste separieren und ausgeben
	$aList = StringSplit(_GUICtrlComboBox_GetList($idCombo), ",")
	For $x = 1 To $aList[0]
		MemoWrite($aList[$x])
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
