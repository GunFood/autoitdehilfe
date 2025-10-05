#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header: Setzt und ermittelt die Reihenfolge der Items (v" & @AutoItVersion & ")", 500, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Setzt die aktuelle Reihenfolge der Items (links nach rechts)
	Local $aOrder[5] = [4, 3, 1, 2, 0]
	_GUICtrlHeader_SetOrderArray($hHeader, $aOrder)

	; Zeigt die aktuelle Reihenfolge der Items (links nach rechts)
	$aOrder = _GUICtrlHeader_GetOrderArray($hHeader)
	For $iI = 0 To $aOrder[0]
		_MemoWrite("Index: " & $iI - 1 & ", Reihenfolge: " & $aOrder[$iI] & ' (' & _GUICtrlHeader_GetItemText($hHeader, $iI - 1) & ')')
	Next

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example