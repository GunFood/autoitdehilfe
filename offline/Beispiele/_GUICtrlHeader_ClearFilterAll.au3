#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>


Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header Filter bereinigen (v" & @AutoItVersion & ")", 450, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGUI, $HDS_FILTERBAR)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; Setzt die Filter
	_GUICtrlHeader_EditFilter($hHeader, 0)
	ControlSend("[ACTIVE]", "", "", "Filter 0{ENTER}")
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Filter 0 geändert")

	_GUICtrlHeader_EditFilter($hHeader, 1)
	ControlSend("[ACTIVE]", "", "", "Filter 1{ENTER}")
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Filter 1 geändert")

	; Löscht alle Filter
	_GUICtrlHeader_ClearFilterAll($hHeader)
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Alle Filter bereinigt")

	_MemoMsgBoxStatus("", Default, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
