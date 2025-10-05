#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header Ermittelt bzw. setzt die Itembreite (v" & @AutoItVersion & ")", 450, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Setzt die Breite von Spalte 0
	_GUICtrlHeader_SetItemWidth($hHeader, 0, 80)

	; Zeigt die Breite von Spalte 0
	_MemoWrite("Breite von Spalte 0: " & _GUICtrlHeader_GetItemWidth($hHeader, 0))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example