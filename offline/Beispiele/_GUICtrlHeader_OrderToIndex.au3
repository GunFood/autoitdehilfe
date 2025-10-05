#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGui = GUICreate("Header", 500, 350, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGui)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 125)

	; Zeigt den Index des Items an Stelle 2
	_MemoWrite("Stelle 2 Index: " & _GUICtrlHeader_OrderToIndex($hHeader, 2))

	_MemoMsgBoxStatus("", -1, $hGui) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example