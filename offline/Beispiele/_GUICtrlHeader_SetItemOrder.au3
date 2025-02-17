#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header Setzt und ermittelt die Item Reihenfolge (v" & @AutoItVersion & ")", 500, 300)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	$g_idMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 125)

	; Setzt die Reihenfolge der ersten Spalte
	_GUICtrlHeader_SetItemOrder($hHeader, 0, 3)

	; Zeigt die Reihenfolge der ersten Spalte
	MemoWrite("Column 0 order: " & _GUICtrlHeader_GetItemOrder($hHeader, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
