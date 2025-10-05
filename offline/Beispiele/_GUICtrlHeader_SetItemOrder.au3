#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header Setzt und ermittelt die Item Reihenfolge (v" & @AutoItVersion & ")", 500, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 125)

	; Setzt die Reihenfolge der Spalte 0
	_GUICtrlHeader_SetItemOrder($hHeader, 0, 3)

	; Zeigt die Reihenfolge der ersten Spalte
	_MemoWrite("Reihenfolge Spalte 0: " & _GUICtrlHeader_GetItemOrder($hHeader, 0))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example