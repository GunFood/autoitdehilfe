#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>
#include <HeaderConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGui = GUICreate("Header", 400, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGui, $HDS_FILTERBAR)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Setzt das Timeoutintervall für das ändern des Filters
	_GUICtrlHeader_SetFilterChangeTimeout($hHeader, 3000)

	; Startet das Ändern in dem festgelegten Filter
	_GUICtrlHeader_EditFilter($hHeader, 0)
	ControlSend("[ACTIVE]", "", "", "Filter 0{ENTER}")
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Filter 0 geändert")

	_GUICtrlHeader_EditFilter($hHeader, 1)
	ControlSend("[ACTIVE]", "", "", "Filter 1{ENTER}")
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Filter 1 geändert")

	_MemoMsgBoxStatus("", -1, $hGui) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example
