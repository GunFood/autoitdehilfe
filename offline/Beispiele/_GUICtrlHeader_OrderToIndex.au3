#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hHeader

	; Erstellt eine GUI
	$hGui = GUICreate("Header", 500, 350)
	$hHeader = _GUICtrlHeader_Create($hGui)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	$g_idMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 125)

	; Zeigt den Index des Items an Stelle 3
	MemoWrite("Stelle 3 Index: " & _GUICtrlHeader_OrderToIndex($hHeader, 2))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
