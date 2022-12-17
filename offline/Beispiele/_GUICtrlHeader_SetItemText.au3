#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header Setzt und ermittelt den Itemtext (v" & @AutoItVersion & ")", 500, 300)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	$g_idMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Setzt den Text von Spalte 1
	_GUICtrlHeader_SetItemText($hHeader, 0, "Spalte X")

	; Zeigt den Text von Spalte 1
	MemoWrite("Text von Spalte 0: " & _GUICtrlHeader_GetItemText($hHeader, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
